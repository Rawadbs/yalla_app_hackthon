import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class ListViewMarket extends StatefulWidget {
  const ListViewMarket({super.key});

  @override
  State<ListViewMarket> createState() => _ListViewMarketState();
}

class _ListViewMarketState extends State<ListViewMarket> {
  List<Map<String, String>> products = [];

  final Map<String, List<Map<String, String>>> countryProducts = {
    'SA': [
      {
        'image': 'assets/images/tshirt_man_sa.png',
        'brand': 'اديداس',
        'color': 'ابيض',
      },
      {
        'image': 'assets/images/tshirt.png',
        'brand': 'اديداس',
        'color': 'اخضر',
      },
    ],
    'DE': [
      {
        'image': 'assets/images/tshirt_man_gr.jpg',
        'brand': 'اديداس',
        'color': 'ابيض',
      },
      {
        'image': 'assets/images/tshirt_man_gr_pink.jpeg',
        'brand': 'اديداس',
        'color': 'وردي',
      },
    ],
    'BR': [
      {
        'image': 'assets/images/tshirt_man_br.jpg',
        'brand': 'نايك',
        'color': 'اصفر',
      },
      {
        'image': 'assets/images/tshirt_man_br_blue.jpg',
        'brand': 'بوما',
        'color': 'ازرق',
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedCountry = prefs.getString('selected_country') ?? 'SA';

    setState(() {
      products = countryProducts[selectedCountry] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Container(
              height: 300.h,
              width: 179.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 179.h,
                        width: 179.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          image: DecorationImage(
                            image: AssetImage(product['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 11.h,
                        right: 7.w,
                        child: SvgPicture.asset('assets/icons/rateing.svg'),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'تيشيرت المنتخب',
                      style: TextStyles.font12BoldBlack,
                    ),
                  ),
                  verticalSpace(8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        _chip(product['brand']!),
                        _chip(product['color']!),
                        _chip('رجالي'),
                      ],
                    ),
                  ),
                  verticalSpace(8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('500', style: TextStyles.font14BoldBlack),
                            SvgPicture.asset(
                                'assets/icons/Saudi_Riyal_blue.svg'),
                            horizntalSpace(8),
                            SvgPicture.asset('assets/icons/points.svg'),
                          ],
                        ),
                        SvgPicture.asset('assets/icons/cart.svg'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      margin: EdgeInsets.only(right: 4.w),
      height: 20.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        color: ColorsManger.greyColor,
      ),
      child: Center(
        child: Text(label, style: TextStyles.font12MediumBlack),
      ),
    );
  }
}
