import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class ListViewPartyHome extends StatelessWidget {
  const ListViewPartyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 82,
                    width: 134,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/draw.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    'رسم',
                    style: TextStyles.font16BoldBlack,
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/location.svg'),
                      horizntalSpace(4),
                      Text(
                        'الرياض ,السعودية',
                        style: TextStyles.font12RegularDarkeGray,
                      ),
                    ],
                  ),
                  verticalSpace(6),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/calendar_gray.svg'),
                      horizntalSpace(4),
                      Text(
                        'الثلاثاء, 01 أبريل 06:00 م',
                        style: TextStyles.font12RegularDarkeGray,
                      ),
                    ],
                  ),
                  verticalSpace(6),
                  Row(
                    children: [
                      Text(
                        'من',
                        style: TextStyles.font12RegularDarkeGray,
                      ),
                      horizntalSpace(4),
                      Text(
                        '50',
                        style: TextStyles.font12BoldBlack,
                      ),
                      horizntalSpace(4),
                      SvgPicture.asset('assets/icons/Saudi_Riyal.svg'),
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
