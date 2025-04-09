import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yalla_app_hackthon/core/helpers/extensions.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/routing/app_router.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: ' لديك حساب بالفعل؟ ',
          style: TextStyles.font14MediumGray,
          children: <TextSpan>[
            TextSpan(
              text: 'تسجيل الدخول',
              style: TextStyles.font14BoldPrimaryBlue,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.loginScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}
