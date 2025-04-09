import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yalla_app_hackthon/core/helpers/extensions.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';

class RowAppBar extends StatelessWidget {
  const RowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Transform.translate(
                  offset: const Offset(0, 10),
                  child: Image.asset('assets/images/Avatar.png')),
              horizntalSpace(16),
              Text('رواد', style: TextStyles.font16BoldWhite),
            ],
          ),
        ),
        // العناصر في الجهة اليمنى
        Row(
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/chat.svg'), // أيقونة إعدادات
              onPressed: () {
                context.pushNamed(Routes.chatBotScreen);
              },
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/notfications.svg'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
