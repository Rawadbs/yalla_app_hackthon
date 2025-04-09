import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yalla_app_hackthon/core/helpers/extensions.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          ColorsManger.brownColorGradient,
          ColorsManger.brownColorGradientend
        ]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // أيقونة الكأس - الزاوية اليسرى العليا
          Positioned(
            top: 10,
            left: 10,
            child: Transform.rotate(
                angle: -0.3, // الميلان لليسار
                child: Opacity(
                  opacity: 0.2,
                  child: SvgPicture.asset(
                    'assets/icons/champ.svg',
                    width: 70,
                    height: 70,
                  ),
                )),
          ),
          // النصوص والزر
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'قدها؟ جاوب وخذ الجائزة!',
                  style: TextStyles.font18BoldWhite,
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 4),
                Text(
                  'شارك في مسابقة الأسئلة الرياضية واربح جوائز\n حماسية كل أسبوع!',
                  style: TextStyles.font14MediumWhite,
                  textAlign: TextAlign.right,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(Routes.challengesScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:
                        Text('ابدأ التحدي', style: TextStyles.font14BoldBrown),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
