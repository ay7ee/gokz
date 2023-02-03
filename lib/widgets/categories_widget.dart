import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

import '../utils/styles.dart';  

class CategoriesWidget extends StatelessWidget {
  final IconData icon;
  final String place;
  final String numbers;
  const CategoriesWidget({super.key, required this.icon, required this.numbers, required this.place});

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Color(0xffC6F8FF)),
                  ),
                  child: Row(children: [
                    const Gap(15),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        color:Color(0xffC6F8FF),
                        shape: BoxShape.circle
                      ),
                      child: Icon(icon, size: 35, color: Color(0xff1CA1B7)),
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 130,
                          child:Text(place, style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w600,fontSize: 18),)),
                      const Gap(5),
                      Container(
                        width: 100,
                        child: Text(numbers, style: Styles.textStyle.copyWith(color: Colors.grey.shade500))),
                    ],),
                    const Gap(60),
                    Icon(Icons.navigate_next, size: 30, color: Colors.grey,)
                  ],)
                )
              ],
            );
  }
}