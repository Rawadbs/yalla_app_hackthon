import 'package:flutter/material.dart';
import 'package:yalla_app_hackthon/core/helpers/extensions.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';
import 'package:yalla_app_hackthon/core/widgets/app_text_button.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
        buttonText: ' تسجيل دخول',
        textStyle: TextStyles.font16BoldWhite,
        onPressed: () {
          context.pushNamed(Routes.mainScreen);
        });
  }
}
