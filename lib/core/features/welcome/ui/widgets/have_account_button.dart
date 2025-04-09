import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_app_hackthon/core/helpers/extensions.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';

class HaveAccountButton extends StatelessWidget {
  const HaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: const BorderSide(
              color: ColorsManger.primaryColor,
            )
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(
          Colors.transparent,
        ),
        padding: WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 10.h,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(double.maxFinite, 45.h),
        ),
      ),
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text(
        'لدي حساب',
        style: TextStyles.font16BoldPrimaryBlue,
      ),
    );
  }
}
