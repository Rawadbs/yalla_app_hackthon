import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class ContainerPoints extends StatelessWidget {
  final int score;
  const ContainerPoints({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 70),
      child: Container(
        height: 18.h,
        width: 65.w,
        decoration: const BoxDecoration(
          color: ColorsManger.yellowColor,
          borderRadius: BorderRadius.all(
            Radius.circular(200),
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SvgPicture.asset('assets/icons/stars.svg'),
          Text('$score نقاط', style: TextStyles.font12MediumBlack),
        ]),
      ),
    );
  }
}
