import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yalla_app_hackthon/core/helpers/extensions.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: ' ليس لديك حساب ؟ ',
          style: TextStyles.font14MediumGray,
          children: <TextSpan>[
            TextSpan(
              text: 'إنشاء حساب',
              style: TextStyles.font14BoldPrimaryBlue,
              recognizer: TapGestureRecognizer()..onTap = () => context.pushNamed(Routes.signupScreen),),
          ],
        ),
      ),
    );
  }
}
