import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentpadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isObscureText,
    this.suffixIcon,
    this.contentpadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return validator(value);
        },
        decoration: InputDecoration(
            isDense: true,
            contentPadding: contentpadding ??
                EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 20.w,
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorsManger.primaryColor, width: 1.3),
                    borderRadius: BorderRadius.circular(7)),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorsManger.lightergrayColor, width: 1.3),
                    borderRadius: BorderRadius.circular(7)),
            hintStyle: hintStyle ?? TextStyles.font16MediumLightGray,
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(7)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorsManger.redColor, width: 1.3),
                borderRadius: BorderRadius.circular(7)),
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: backgroundColor ?? Colors.white),
        obscureText: isObscureText ?? false,
        style: TextStyles.font16MediumBlack,
      ),
    );
  }
}
