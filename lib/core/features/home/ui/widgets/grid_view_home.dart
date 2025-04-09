import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class GridViewHome extends StatelessWidget {
  const GridViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'name': 'تذاكر المباريات', 'icon': 'assets/icons/ticket.svg'},
      {'name': 'المتجر', 'icon': 'assets/icons/market_black.svg'},
      {'name': 'الحفلات', 'icon': 'assets/icons/party.svg'},
      {'name': 'السكن', 'icon': 'assets/icons/houseing.svg'},
      {'name': 'الطيران', 'icon': 'assets/icons/airplane.svg'},
      {'name': 'هذا الأسبوع', 'icon': 'assets/icons/calendar.svg'},
    ];
    return GridView.builder(
      shrinkWrap: true, // يسمح بالتمرير في الـ GridView
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // عدد الأعمدة
        crossAxisSpacing: 20.w,
        // المسافة بين الأعمدة
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(items[index]);
      },
    );
  }

  Widget _buildItem(Map<String, String> item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          item['icon']!,
          height: 24,
          width: 24,
          fit: BoxFit.cover,
        ),
        verticalSpace(8),
        Text(item['name']!, style: TextStyles.font16BoldDarketBlue),
      ],
    );
  }
}
