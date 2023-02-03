import 'package:gokz/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlideUpPanel extends StatelessWidget {
  final PanelController panelController;
  final ScrollController controller;
  final String des;
  const SlideUpPanel({
    Key? key,
    required this.des,
    required this.panelController,
    required this.controller,
  }) : super(key: key);

@override
Widget build(BuildContext context) =>  Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
      boxShadow: [
        BoxShadow(
          blurRadius: 20.0,
          color: Colors.grey,
        ),
      ]
    ),
    margin: const EdgeInsets.all(24.0),
    child: Padding(
      padding: const EdgeInsets.only(left:25, right: 25, bottom: 25, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 3,
                width: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          Text("Description", style: Styles.headLineStyle2.copyWith(fontSize: 18, color: Color(0xff1CA1B7)),),
          const Gap(15),
          Center(
            child: Text("${des}"),
          ),
        ],
      ),
    ),
  );
}