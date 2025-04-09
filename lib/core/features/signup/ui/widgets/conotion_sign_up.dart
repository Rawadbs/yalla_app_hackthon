import 'package:flutter/material.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class ConotionSignUp extends StatelessWidget {
  const ConotionSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'يجب أن تتكون كلمة المرور من ',
        style: TextStyles.font12MediumDarkestBlue,
        children: <TextSpan>[
          TextSpan(
            text: '8 أحرف',
            style: TextStyles.font12MediumPrimarytBlue, // اللون الثاني
          ),
          TextSpan(
            text: ' على الأقل ويجب أن تحتوي على ',
            style: TextStyles.font12MediumDarkestBlue,
          ),
          TextSpan(
            text: 'حرف كبير ورقم وحرف خاص',
            style: TextStyles.font12MediumPrimarytBlue, // اللون الثاني
          ),
          TextSpan(
            text: ' على الأقل.',
            style: TextStyles.font12MediumDarkestBlue,
          ),
        ],
      ),
    );
  }
}
