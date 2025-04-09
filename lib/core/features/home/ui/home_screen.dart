import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalla_app_hackthon/core/widgets/container_points.dart';
import 'package:yalla_app_hackthon/core/features/home/ui/widgets/grid_view_home.dart';
import 'package:yalla_app_hackthon/core/features/home/ui/widgets/list_view_fans_zone_home.dart';
import 'package:yalla_app_hackthon/core/features/home/ui/widgets/list_view_match_home.dart';
import 'package:yalla_app_hackthon/core/features/home/ui/widgets/list_view_party_home.dart';
import 'package:yalla_app_hackthon/core/widgets/row_app_bar.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import '../../../helpers/spacing.dart';
import 'widgets/challenge_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _loadScore();
  }

  Future<void> _loadScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _score = prefs.getInt('quiz_score') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManger.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 112.h,
                width: double.infinity,
                color: ColorsManger.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20),
                    const RowAppBar(),
                    ContainerPoints(
                      score: _score,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorsManger.bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          verticalSpace(40),
                          const ChallengeCard(),
                          verticalSpace(20),
                          Text(
                            'مباريات تهمك',
                            style: TextStyles.font20BoldBlack,
                          ),
                          verticalSpace(12),
                          const ListViewMatchHome(),
                          verticalSpace(32),
                          const GridViewHome(),
                          verticalSpace(20),
                          Text(
                            ' احدث الفعاليات ',
                            style: TextStyles.font20BoldBlack,
                          ),
                          verticalSpace(12),
                          const ListViewPartyHome(),
                          verticalSpace(20),
                          Text(
                            'استكشف مناطق تجمع الجمهور',
                            style: TextStyles.font20BoldBlack,
                          ),
                          verticalSpace(12),
                          const ListViewFansZoneHome(),
                          verticalSpace(12),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
