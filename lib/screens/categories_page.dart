import 'package:gokz/widgets/categories_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

import '../utils/styles.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Column(
          children: [
            Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          image:const DecorationImage(fit:BoxFit.cover, image:AssetImage("assets/images/ava.png"))),
                        ),
                        InkWell(
                          child:Icon(Icons.search_outlined, size: 27, color: Colors.black),
                          onTap: (() {}),
                          )
                        ],  
                    ),
            const Gap(30),
            Row(
                        children: [
                          Text("Categories", style: Styles.headlineStyle1.copyWith(fontSize: 30,fontWeight: FontWeight.w900, color: Colors.black)),
                        ],
                      ),
            const Gap(30),
            const CategoriesWidget(icon: FluentSystemIcons.ic_fluent_food_regular, place: "Restaurants", numbers: "322 Destinations",),
            const Gap(10),
            const CategoriesWidget(icon: Icons.hotel, place: "Hotels", numbers: "203 Destinations",),
            const Gap(10),
            const CategoriesWidget(icon: Icons.attractions, place: "Entertainments", numbers: "248 Destinations",),
          ],
        ),
      ),
    );
  }
}