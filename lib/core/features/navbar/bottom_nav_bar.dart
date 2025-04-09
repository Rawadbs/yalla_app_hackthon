import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalla_app_hackthon/core/features/community/ui/community_screen.dart';

import 'package:yalla_app_hackthon/core/features/home/ui/home_screen.dart';
import 'package:yalla_app_hackthon/core/features/store/ui/store_screen.dart';
import 'package:yalla_app_hackthon/core/resources/assets.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final pages = [
    const HomeScreen(),
    const CommunityScreen(),
    const StoreScreen(),
    const StoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: pages[currentIndex], // عرض الصفحة المحددة
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // إضافة ظل لـ BottomNavigationBar
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // لون الظل
                    spreadRadius: 0, // انتشار الظل
                    blurRadius: 8, // قوة تأثير الضباب
                    offset:
                        const Offset(0, -4), // اتجاه الظل (لأعلى في هذه الحالة)
                  ),
                ],
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,

                backgroundColor: Colors.white,
                selectedItemColor:
                    ColorsManger.primaryColor, // لون العنصر المحدد
                currentIndex: currentIndex, // تحديث التبويب الحالي
                selectedLabelStyle: TextStyles.font12MediumPrimarytBlue,
                unselectedLabelStyle: TextStyles.font12MediumLightGray,
                elevation: 0,
                onTap: (index) {
                  setState(() {
                    currentIndex = index; // تغيير الصفحة عند الضغط
                  });
                },

                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      currentIndex == 0
                          ? IconsAssets.homePrimary
                          : IconsAssets.home,
                    ),
                    label: 'الرئيسية',
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        currentIndex == 1
                            ? IconsAssets.communityPrimary
                            : IconsAssets.community,
                      ),
                      label: 'المجتمعات'),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      currentIndex == 2
                          ? IconsAssets.marketPrimary
                          : IconsAssets.market,
                    ),
                    label: 'المتجر',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      currentIndex == 3
                          ? IconsAssets.morePrimary
                          : IconsAssets.more,
                    ),
                    label: 'المزيد',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
