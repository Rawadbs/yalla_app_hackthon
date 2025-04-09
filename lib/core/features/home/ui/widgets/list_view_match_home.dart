import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewMatchHome extends StatelessWidget {
  const ListViewMatchHome({super.key});

  @override
  Widget build(BuildContext context) {
      final List<String> images = [
      'assets/images/match.png',
      'assets/images/match_1.png',
    ];
    return   SizedBox(
                            height: 140,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          );
  }
}