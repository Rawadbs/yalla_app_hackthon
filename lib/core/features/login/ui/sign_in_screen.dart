import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yalla_app_hackthon/core/features/login/ui/widgets/sign_in_button.dart';
import 'package:yalla_app_hackthon/core/features/login/ui/widgets/sign_in_form.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/assets.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

import 'widgets/dont_have_account_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManger.bgColor,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorsManger.primaryColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: IconButton(
                icon: SvgPicture.asset(IconsAssets.language),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تسجيل دخول',
                  style: TextStyles.font20BoldBlack,
                ),
                verticalSpace(8),
                Text(
                  'أهلاً بعودتك مجدداً',
                  style: TextStyles.font16MediumBlack,
                ),
                verticalSpace(24),
                const SignInForm(),
                verticalSpace(16),
                Text(
                  'هل نسيت كلمة المرور؟',
                  style: TextStyles.font14BoldDarkBlue,
                ),
                verticalSpace(24),
                const SignInButton(),
                verticalSpace(24),
                const DontHaveAccountText(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
