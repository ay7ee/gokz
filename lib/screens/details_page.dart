import 'dart:convert';

import 'package:gokz/data/places.dart';
import 'package:gokz/utils/styles.dart';
import 'package:gokz/widgets/sliding_up_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;


class DetailPage extends StatefulWidget {
  final int locationId;
  DetailPage(this.locationId);

  @override
  State<DetailPage> createState() => _DetailPageState();
}
Map? mapResponse;
class _DetailPageState extends State<DetailPage> {
  final PanelController _pc = new PanelController();
  

  Future apiCall() async{
        http.Response response;
        response = await http.get(Uri.parse("https://firestore.googleapis.com/v1/projects/gokz-d04ed/databases/(default)/documents/Places"));
        if(response.statusCode == 200){
          setState((){
           mapResponse = json.decode(response.body);
          });

  }
} 

@override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: apiCall(),
      builder: (context, snapshot) {
      if(mapResponse != null){
      return Scaffold(
      body:SlidingUpPanel(
        backdropEnabled: true,
        minHeight: 0,
        maxHeight: 400,
        defaultPanelState: PanelState.CLOSED,
        controller: _pc,
        renderPanelSheet: false,
        parallaxEnabled: true,
        parallaxOffset: 0.15,
        panelBuilder: (controller) => SlideUpPanel(
          des: mapResponse?['documents'][widget.locationId]['fields']['description']['stringValue'],
          panelController: _pc,
          controller: controller
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                  width: double.infinity,
                  height: height*.63,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: height*1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)) ,
                      child: Image.network(
                        mapResponse?['documents'][widget.locationId]['fields']['image']['stringValue'],
                        fit: BoxFit.cover,
                        
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                    ),
                  ),
                  Container(child: 
                  Text("${mapResponse?['documents'][widget.locationId]['fields']['name']['stringValue']}", style: Styles.headlineStyle1.copyWith(color: Colors.white),), 
                  alignment: Alignment.bottomLeft,
                  padding:EdgeInsets.only(bottom: 65, left: 25),
                  ),
                  Container(
                    child: 
                  Row(
                    children: [
                      Icon(Icons.location_pin, size: 15, color: Colors.white,),
                      Text("${mapResponse?['documents'][widget.locationId]['fields']['address']['stringValue']}", style: Styles.headLineStyle3.copyWith(color: Colors.white, fontSize:15, fontWeight: FontWeight.w400),),
                      const Gap(20),
                      Icon(Icons.star, size: 15, color: Colors.white,),
                      Text("4.6", style: Styles.headLineStyle3.copyWith(color: Colors.white, fontSize:15, fontWeight: FontWeight.w400))
                    ],
                  ), 
                  alignment: Alignment.bottomLeft,
                  padding:EdgeInsets.only(bottom: 45, left: 25),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Container(
                    color: Colors.grey.shade300,
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      child: Text("Description", style: Styles.headLineStyle3.copyWith(color:Colors.black, fontWeight: FontWeight.w400),),
                      onTap: (() {
                        if(_pc.isPanelOpen){
                        _pc.hide();
                        }
                        else _pc.open();
                        }),
                    ),
                  ),
                  const Gap(35),
                   Container(
                    color: Colors.grey.shade300,
                    padding: EdgeInsets.all(5),
                     child: InkWell(
                      child: Text("Review", style: Styles.headLineStyle3.copyWith(color:Colors.black, fontWeight: FontWeight.w400),),
                      onTap: (() {}),
                  ),
                   ),
                ],
              ),
            ),
            const Gap(20),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text("${mapResponse?['documents'][widget.locationId]['fields']['description']['stringValue']}", style: Styles.headLineStyle4.copyWith(fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis, maxLines: 4,),
            ),
            Flexible(
              flex: 1,
              // padding: EdgeInsets.symmetric(horizontal: 25),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "\$${mapResponse?['documents'][widget.locationId]['fields']['price']['integerValue']}",
                            style: Styles.headlineStyle1.copyWith(color: Colors.orange.shade300), 
                            children: <TextSpan>[
                              TextSpan(
                                text: " /Entrance",
                                style: Styles.headLineStyle4.copyWith(color: Colors.grey.shade400, fontWeight: FontWeight.w400),
                              )
                            ]
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xffC04757),
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: InkWell(
                            child: Text("Leave A Review", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      );
      }
      else{
        return Scaffold(
          body: Center(child: Text("Loading...")),
        );
      }
      },
      
    );
  }
}