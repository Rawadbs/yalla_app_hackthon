import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:yalla_app_hackthon/core/features/communitychat/ui/widgets/app_bar_community_chat.dart';
import 'package:yalla_app_hackthon/core/features/communitychat/ui/widgets/chat.dart';
import 'package:yalla_app_hackthon/core/features/communitychat/ui/widgets/container_rules_community.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/widgets/app_text_form.dart';

class CommunityChatScreen extends StatelessWidget {
  final String teamName;
  final String logoImage;
  const CommunityChatScreen(
      {super.key, required this.teamName, required this.logoImage});

  @override
  Widget build(BuildContext context) {
    
final String formattedDate =
    intl.DateFormat('EEEE، d MMMM', 'ar').format(DateTime.now());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManger.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              // Custom AppBar
              Container(
                height: 112.h,
                width: double.infinity,
                color: ColorsManger.primaryColor,
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: AppBarCommunityChat(
                      teamName: teamName,
                      logoImage: logoImage,
                    )),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorsManger.bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const ContainerRulesCommunity(),
      
                      Text(formattedDate, style: TextStyles.font14BoldBlack),
      
                      // الرسائل
                      const Chat(),
      
                      // حقل كتابة الرسائل
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                hintText: 'اكتب رسالتك',
                                validator: (value) {},
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 17),
                                  child:
                                      SvgPicture.asset('assets/icons/sent.svg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
