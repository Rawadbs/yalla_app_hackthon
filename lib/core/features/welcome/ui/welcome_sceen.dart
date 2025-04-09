import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalla_app_hackthon/core/features/welcome/ui/widgets/get_ready_button.dart';
import 'package:yalla_app_hackthon/core/features/welcome/ui/widgets/have_account_button.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class WelcomeSceen extends StatelessWidget {
  const WelcomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManger.bgColor,
          elevation: 0,
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(80),
              Center(
                child: SvgPicture.asset(
                  'assets/images/logo_blue.svg',
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text('عيش الحماس من أول لمسة', style: TextStyles.font16BoldBlack),
              Text('تذكرتك.. حجزك.. حماسك.. كلهم هنا',
                  style: TextStyles.font16BoldBlack),
              verticalSpace(100),
              const GetReadyButton(),
              verticalSpace(20),
              const HaveAccountButton(),
            ],
          ),
        )),
      ),
    );
  }
}
