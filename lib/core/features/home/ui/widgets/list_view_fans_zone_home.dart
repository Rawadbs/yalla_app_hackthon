import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class ListViewFansZoneHome extends StatelessWidget {
  const ListViewFansZoneHome({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة تحتوي على البيانات المتعددة
    final List<Map<String, String>> items = [
      {
        'name': 'بوليفارد سيتي',
        'location': 'الرياض ,السعودية',
        'date': 'الثلاثاء, 01 أبريل 06:00 م',
        'fansCount': '4000 مشجع',
        'image': 'assets/images/fanzone2.png',
      },
      {
        'name': 'بوليفارد وورد',
        'location': 'الرياض ,السعودية',
        'date': 'الأربعاء, 02 أبريل 07:00 م',
        'fansCount': '3500 مشجع',
        'image': 'assets/images/fanzone3.png',
      },
      {
        'name': 'الصقر',
        'location': 'الرياض ,السعودية',
        'date': 'الخميس, 03 أبريل 08:00 م',
        'fansCount': '5000 مشجع',
        'image': 'assets/images/fanzone1.png',
      },
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // عرض الصورة من البيانات
                Container(
                  height: 82,
                  width: 134,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    image: DecorationImage(
                      image: AssetImage(item['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verticalSpace(20),
                // عرض اسم المشجع
                Text(
                  item['name']!,
                  style: TextStyles.font16BoldBlack,
                ),
                verticalSpace(12),
                // عرض موقع المشجع
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/location.svg'),
                    horizntalSpace(4),
                    Text(
                      item['location']!,
                      style: TextStyles.font12RegularDarkeGray,
                    ),
                  ],
                ),
                verticalSpace(6),
                // عرض تاريخ الفعالية
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/calendar_gray.svg'),
                    horizntalSpace(4),
                    Text(
                      item['date']!,
                      style: TextStyles.font12RegularDarkeGray,
                    ),
                  ],
                ),
                verticalSpace(6),
                // عرض عدد المشجعين
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/community_gray.svg'),
                    horizntalSpace(4),
                    Text(
                      item['fansCount']!,
                      style: TextStyles.font12BoldBlack,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
