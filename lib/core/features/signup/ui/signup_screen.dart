import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_app_hackthon/core/features/signup/ui/widgets/conotion_sign_up.dart';
import 'package:yalla_app_hackthon/core/features/signup/ui/widgets/create_account_button.dart';
import 'package:yalla_app_hackthon/core/features/signup/ui/widgets/have_account_text.dart';
import 'package:yalla_app_hackthon/core/features/signup/ui/widgets/sign_up_form.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/assets.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManger.bgColor,
          elevation: 0,
          automaticallyImplyLeading: false,
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
                  'إنشاء حساب ',
                  style: TextStyles.font20BoldBlack,
                ),
                verticalSpace(60),
                const SignupForm(),
                verticalSpace(8),
                const ConotionSignUp(),
                verticalSpace(16),
                Text(
                  'هل نسيت كلمة المرور؟',
                  style: TextStyles.font14BoldDarkBlue,
                ),
                verticalSpace(24),
                const CreateAccountButton(),
                verticalSpace(24),
                const HaveAccountText(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
