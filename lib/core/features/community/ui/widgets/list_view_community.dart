// ✅ ListViewCommunity.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalla_app_hackthon/core/features/communitychat/ui/community_chat.dart';
import 'package:yalla_app_hackthon/core/helpers/spacing.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class ListViewCommunity extends StatefulWidget {
  const ListViewCommunity({super.key});

  @override
  State<ListViewCommunity> createState() => _ListViewCommunityState();
}

class _ListViewCommunityState extends State<ListViewCommunity> {
  List<String> images = [
    'assets/images/trophy_sa.png',
    'assets/images/trophy_gr.png',
    'assets/images/trophy_br.png',
  ];
  List<String> logos = [
    'assets/images/logo_sa.png',
    'assets/images/logo_ger.png',
    'assets/images/logo_br.jpg',
  ];
  List<String> teamNames = ['السعودية', 'المانيا', 'البرازيل'];
  List<String> membersCount = ['40.000 عضوًا', '35.000 عضوًا', '12.500 عضوًا'];

  final Map<String, String> countryNameMap = {
    'SA': 'السعودية',
    'DE': 'المانيا',
    'BR': 'البرازيل',
  };

  @override
  void initState() {
    super.initState();
    _reorderListBasedOnSelectedCountry();
  }

  Future<void> _reorderListBasedOnSelectedCountry() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedCode = prefs.getString('selected_country');

    if (selectedCode != null && countryNameMap.containsKey(selectedCode)) {
      final selectedName = countryNameMap[selectedCode];

      final index = teamNames.indexOf(selectedName!);
      if (index != -1) {
        setState(() {
          final name = teamNames.removeAt(index);
          final img = images.removeAt(index);
          final logo = logos.removeAt(index);
          final count = membersCount.removeAt(index);

          teamNames.insert(0, name);
          images.insert(0, img);
          logos.insert(0, logo);
          membersCount.insert(0, count);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CommunityChatScreen(
                    teamName: teamNames[index],
                    logoImage: logos[index],
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Container(
                height: 175.h,
                width: 140.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 103.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60.h,
                      left: 43.w,
                      child: Container(
                        height: 54.h,
                        width: 54.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.r),
                          image: DecorationImage(
                            image: AssetImage(logos[index]),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8.h,
                      left: 0.w,
                      right: 0.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(teamNames[index],
                                  style: TextStyles.font16BoldBlack),
                              SvgPicture.asset('assets/icons/aproved.svg'),
                            ],
                          ),
                          verticalSpace(6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/comunity.svg'),
                              horizntalSpace(4),
                              Text(membersCount[index],
                                  style: TextStyles.font12RegularDarkeGray),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
