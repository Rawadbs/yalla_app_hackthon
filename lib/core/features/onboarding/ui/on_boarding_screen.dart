// ✅ OnBoardingScreen.dart
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalla_app_hackthon/core/helpers/extensions.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';
import 'package:yalla_app_hackthon/core/widgets/app_text_button.dart';
import 'package:yalla_app_hackthon/core/widgets/app_text_form.dart';
import '../../../resources/styles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Country? selectedCountry = Country.parse('SA');
  List<String> suggestedCountries = ['RS', 'QA', 'ES', 'TR'];
  String? selectedSuggestedCode;

  final Map<String, String> countryNamesAr = {
    'SA': 'السعودية',
    'RS': 'صربيا',
    'QA': 'قطر',
    'ES': 'إسبانيا',
    'TR': 'تركيا',
    'DE': 'المانيا',
    'BR': 'البرازيل',
  };

  void toggleSuggestion(String code) {
    setState(() {
      if (selectedSuggestedCode == code) {
        // ✅ إذا ضغطت مرة ثانية على نفس الدولة → ألغِ التحديد
        selectedSuggestedCode = null;
        selectedCountry = null;
      } else {
        // ✅ حدد الدولة الجديدة
        selectedSuggestedCode = code;
        selectedCountry = Country.parse(code);
      }
    });
    _saveSelectedCountryCode(code);
  }

  Future<void> _saveSelectedCountryCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_country', code);
  }

  @override
  Widget build(BuildContext context) {
    final selectedCode = selectedCountry?.countryCode;
    final selectedName = selectedCode != null
        ? countryNamesAr[selectedCode] ?? selectedCountry!.name
        : 'اختر دولة';
    final selectedFlag = selectedCountry?.flagEmoji ?? '';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManger.bgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(50),
                Text('تابع أخبار الفرق', style: TextStyles.font20BoldBlack),
                verticalSpace(24),
                GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: false,
                      countryListTheme: const CountryListThemeData(
                        flagSize: 25,
                        textStyle: TextStyle(fontSize: 16),
                        bottomSheetHeight: 400,
                      ),
                      onSelect: (Country country) {
                        setState(() {
                          selectedCountry = country;
                          selectedSuggestedCode =
                              null; // ✅ يمسح أي اختيار من المقترحات
                        });
                        _saveSelectedCountryCode(country.countryCode);
                      },
                    );
                  },
                  child: AbsorbPointer(
                    child: AppTextFormField(
                      hintText: '...البحث',
                      validator: (value) {},
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/search.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('المقترح للبلدان', style: TextStyles.font14BoldBlack),
                const SizedBox(height: 10),
                if (selectedCountry != null)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCountry = null; // ✅ حذف الدولة المختارة
                        selectedSuggestedCode =
                            null; // ✅ حذف من المقترحات أيضًا
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: ColorsManger.primaryColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(selectedCountry!.flagEmoji,
                                  style: const TextStyle(fontSize: 20)),
                              horizntalSpace(8),
                              Text(
                                countryNamesAr[selectedCountry!.countryCode] ??
                                    selectedCountry!.name,
                                style: TextStyles.font16BoldBlack,
                              ),
                            ],
                          ),
                          const Icon(Icons.check_box,
                              color: ColorsManger.primaryColor),
                        ],
                      ),
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('اختر دولة', style: TextStyles.font16BoldBlack),
                        const Icon(Icons.check_box_outline_blank,
                            color: Colors.grey),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                Text('مقترحات', style: TextStyles.font14BoldBlack),
                const SizedBox(height: 10),
                ...suggestedCountries.map((code) {
                  final country = Country.parse(code);
                  final isSelected = selectedSuggestedCode == code;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: GestureDetector(
                      onTap: () => toggleSuggestion(code),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: isSelected
                                ? ColorsManger.primaryColor
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(country.flagEmoji),
                                horizntalSpace(8),
                                Text(
                                  countryNamesAr[code] ?? country.name,
                                  style: TextStyles.font16BoldBlack,
                                ),
                              ],
                            ),
                            Icon(
                              isSelected
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: isSelected
                                  ? ColorsManger.primaryColor
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    buttonText: 'التالي',
                    textStyle: TextStyles.font16BoldWhite,
                    onPressed: () {
                      context.pushNamed(Routes.mainScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
