import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalla_app_hackthon/core/widgets/container_points.dart';

import 'package:yalla_app_hackthon/core/widgets/row_app_bar.dart';
import 'package:yalla_app_hackthon/core/features/store/ui/widgets/list_view_market.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/widgets/app_text_form.dart';

import '../../../helpers/spacing.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int _score = 0;
  String? bannerImage;

  @override
  void initState() {
    super.initState();
    _loadScore();
    _loadBannerImage();
  }

  Future<void> _loadScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _score = prefs.getInt('quiz_score') ?? 0;
    });
  }

  Future<void> _loadBannerImage() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedCountry = prefs.getString('selected_country') ?? 'SA';

    final Map<String, String> countryBanner = {
      'SA': 'assets/images/banner_sa.png',
      'DE': 'assets/images/banner_gr.jpg',
      'BR': 'assets/images/banner_br.jpg',
    };

    setState(() {
      bannerImage =
          countryBanner[selectedCountry] ?? 'assets/images/banner_sa.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManger.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 112.h,
                width: double.infinity,
                color: ColorsManger.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20),
                    const RowAppBar(),
                    ContainerPoints(score: _score),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorsManger.bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(40),
                          AppTextFormField(
                            hintText: 'البحث...',
                            validator: (value) {},
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/search.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          verticalSpace(20),
                          if (bannerImage != null)
                            Container(
                              width: double.infinity,
                              height: 118.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                  image: AssetImage(bannerImage!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          else
                            Container(
                              height: 118.h,
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                          verticalSpace(20),
                          Text(
                            ' افضل المنتجات ',
                            style: TextStyles.font20BoldBlack,
                          ),
                          verticalSpace(12),
                          const ListViewMarket(),
                          verticalSpace(12),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
