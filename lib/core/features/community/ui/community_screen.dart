import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalla_app_hackthon/core/features/community/ui/widgets/list_view_community.dart';
import 'package:yalla_app_hackthon/core/widgets/container_points.dart';

import 'package:yalla_app_hackthon/core/widgets/row_app_bar.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/widgets/app_text_form.dart';

import '../../../helpers/spacing.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
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
                          AppTextFormField(
                            hintText: 'البحث...',
                            validator: (value) {},
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/search.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          verticalSpace(20),
                          Text(
                            'مقترحات لك',
                            style: TextStyles.font20BoldBlack,
                          ),
                          verticalSpace(12),
                          const ListViewCommunity(),
                          verticalSpace(20),
                          Text(
                            ' افضل المجتمعات ',
                            style: TextStyles.font20BoldBlack,
                          ),
                          verticalSpace(12),
                          const ListViewCommunity(),
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
