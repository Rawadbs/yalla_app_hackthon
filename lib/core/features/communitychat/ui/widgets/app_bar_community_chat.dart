import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class AppBarCommunityChat extends StatelessWidget {
  final String teamName;
  final String logoImage;

  const AppBarCommunityChat({
    super.key,
    required this.teamName,
    required this.logoImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        horizntalSpace(16),
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.r),
            image: DecorationImage(
              image: AssetImage(logoImage),
            ),
          ),
        ),
        horizntalSpace(16),
        Row(
          children: [
            Text(teamName, style: TextStyles.font16BoldWhite),
            horizntalSpace(6),
            SvgPicture.asset('assets/icons/aproved.svg'),
          ],
        ),
        const Spacer(),
        SvgPicture.asset('assets/icons/report.svg'),
      ],
    );
  }
}
