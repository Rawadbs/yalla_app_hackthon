import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalla_app_hackthon/core/features/home/ui/widgets/challenge_card.dart';
import 'package:yalla_app_hackthon/core/helpers/extensions.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';
import 'package:yalla_app_hackthon/core/widgets/app_text_button.dart';
import 'package:yalla_app_hackthon/core/networking/networking.dart'; // تأكد أن هذا يستدعي AIChatService

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  List<Map<String, dynamic>> _questions = [];
  int _currentQuestionIndex = 0;
  String? _selectedOption;
  int _score = 0;
  bool _isLoading = true;
  bool _isLocked = false;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _checkAccess();
  }

  Future<void> _loadQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final lastFetched = prefs.getString('lastFetchedDate');
    final today = now.toIso8601String().substring(0, 10);

    if (lastFetched == today && prefs.containsKey('cachedQuestions')) {
      final cached = prefs.getString('cachedQuestions');
      final decoded = jsonDecode(cached!) as List;
      _questions = decoded.map((e) => Map<String, dynamic>.from(e)).toList();
    } else {
      final questions = await AIChatService.fetchFootballQuiz();
      if (questions.isNotEmpty) {
        _questions = questions;
        prefs.setString('cachedQuestions', jsonEncode(questions));
        prefs.setString('lastFetchedDate', today);
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _checkAccess() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final lastAttemptStr = prefs.getString('lastAttempt');

    if (lastAttemptStr != null) {
      final lastAttempt = DateTime.parse(lastAttemptStr);
      final diff = now.difference(lastAttempt);

      if (diff.inHours < 24) {
        setState(() {
          _isLocked = true;
          _remainingTime = const Duration(hours: 24) - diff;
        });
        return;
      }
    }

    // مسموح له بالدخول، نحدث وقت المحاولة
    await prefs.setString('lastAttempt', now.toIso8601String());
    await _loadQuestions();
  }

  void _nextQuestion() {
    if (_selectedOption == _questions[_currentQuestionIndex]['correctAnswer']) {
      _score++;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOption = null;
      });
    } else {
      _finishQuiz();
    }
  }

  Future<void> _finishQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quiz_score', _score);

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: ColorsManger.bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('🎉 ! مبروك',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyles.font16BoldBlack),
        content: Text('حصلت على $_score نقطة من ${_questions.length}',
            textAlign: TextAlign.center, style: TextStyles.font16BoldBlack),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => context.pushReplacementNamed(Routes.mainScreen),
            child: Text('العودة', style: TextStyles.font16BoldBlack),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLocked) {
      final hours = _remainingTime.inHours;
      final minutes = _remainingTime.inMinutes.remainder(60);

      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorsManger.bgColor,
          appBar: AppBar(
            backgroundColor: ColorsManger.bgColor,
            leading: IconButton(
                onPressed: context.pop, icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_clock, size: 64, color: Colors.grey[700]),
                verticalSpace(16),
                Text(
                  'تم حل التحدي، حاول مرة أخرى بعد ٢٤ ساعة.',
                  style: TextStyles.font16BoldBlack,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(8),
                Text(
                  'الوقت المتبقي: ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} ساعة',
                  style: TextStyles.font14MediumGray,
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final current = _questions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / _questions.length;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManger.bgColor,
        appBar: AppBar(
          backgroundColor: ColorsManger.bgColor,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                  child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  ' تخطي',
                  style: TextStyles.font14BoldPrimaryBlue,
                ),
              )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                color: ColorsManger.primaryColor,
              ),
              verticalSpace(24),
              Text(
                current['question'],
                style: TextStyles.font16BoldBlack,
              ),
              verticalSpace(16),
              ...List.generate(
                current['options'].length,
                (index) {
                  final option = current['options'][index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: _selectedOption == option
                            ? ColorsManger.primaryColor
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: RadioListTile<String>(
                      activeColor: ColorsManger.primaryColor,
                      value: option,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                      title: Text(option, style: TextStyles.font14BoldBlack),
                    ),
                  );
                },
              ),
              const Spacer(),
              AppTextButton(
                buttonText: 'التالي',
                onPressed: _selectedOption == null ? null : _nextQuestion,
                textStyle: TextStyles.font16BoldWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
