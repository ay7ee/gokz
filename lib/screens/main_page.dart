import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gokz/data/places.dart';
import 'package:gokz/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'details_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
Map? mapResponse;
class _MainPageState extends State<MainPage> {
  Future apiCall() async{
        http.Response response;
        response = await http.get(Uri.parse("https://firestore.googleapis.com/v1/projects/gokz-d04ed/databases/(default)/documents/Places"));
        if(response.statusCode == 200){
          setState(() {
           mapResponse = json.decode(response.body);
          });
  }
} 

// Reference refRoot = FirebaseStorage.instance.ref();
// printUrl(int index) {
// Reference dirImage = refRoot.child('image');
// Reference image = dirImage.child(mapResponse['documents'][index]['fields']['image']['stringValue']);
// String url = "https://" + image.getDownloadURL().toString();
// return url;
// }


@override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return FutureBuilder(
      future: apiCall(),
      builder: (context, snapshot) {
      if(mapResponse != null){
      return Scaffold(
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              const Gap(60),
              Row(
                children: [
                    Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    image:const DecorationImage(fit:BoxFit.cover, image:AssetImage("assets/images/ava.png"))),
                  ),
                  const Gap(10),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         RichText(text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: 'Hi ', style: Styles.headLineStyle2),
                              TextSpan( text: user?.displayName==null ?"asd":user?.displayName , style: Styles.headLineStyle2.copyWith(color: Colors.orange.shade300, ),)
                          ],
                          ),
                            ),
                            const Gap(5),
                        Text("Let's discover Kazakhstan", style: Styles.textStyle.copyWith(color: Styles.textColor2, fontSize: 14, fontWeight: FontWeight.w400),)
                      ],
                    ),
                  )
                ],
              ),
              Gap(30),
    
    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Container(
                  padding: EdgeInsets.only(left: 20, right: 10, bottom: 5),
                  height: 55,
                  width: 350,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 239, 249, 253)),
                   child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Search...',
                      labelStyle: Styles.textStyle.copyWith(color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w400),
                      suffixIcon: Icon(Icons.search_outlined, size: 27, color: Colors.black,),
                      floatingLabelBehavior: FloatingLabelBehavior.never
                ),
               ),
                 ),
                ],
              ),
              const Gap(30),
              Row(
                children: [
                  Text("Discover", style: Styles.headlineStyle1.copyWith(fontSize: 30,fontWeight: FontWeight.w900, color: Colors.black))
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Container(
                    child:InkWell(
                      hoverColor:Colors.orange.shade300 ,
                    onTap: () {
                    },
                    child: Text('Trend', style: Styles.headLineStyle3.copyWith(color:Colors.grey.shade400, fontWeight: FontWeight.w400),),
                    ),
                  ),
                  const Gap(30),
                  Container(
                    child:InkWell(
                      hoverColor:Colors.orange.shade300 ,
                       onTap: () {},
                    child: Text('Top Visited', style: Styles.headLineStyle3.copyWith(color:Colors.grey.shade400, fontWeight: FontWeight.w400),),
                    ),
                  )
                ],
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20,
                mainAxisExtent: 200),
                itemCount: mapResponse?['documents'].length, 
                itemBuilder: (context , index){ 
                return InkWell(
                  onTap:(() {
                    _navigating(context, index);
                  }),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xffC0F7FF),),
                    child: Column(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                            child: Image.network(
                              "${mapResponse?['documents'][index]['fields']['image']['stringValue']}"
                              , height: 120, fit: BoxFit.cover, width: double.infinity,),)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text("${mapResponse?['documents'][index]['fields']['name']['stringValue']}", style: Styles.headLineStyle2.copyWith(color:Colors.orange.shade300 ),),
                
                                Row(
                                  children: [
                                    Icon(Icons.location_pin, color: Colors.orange.shade300 ,),
                                    Text("${mapResponse?['documents'][index]['fields']['address']['stringValue']}", style: Styles.textStyle.copyWith(fontSize: 14),),
                                  ],
                                ),
                                ],)
                ],
                            ),
                          )
                          
                      ],
                    ),  
                  ),
                );
              },)
            ],
          )
      );
      }
      else{
        return Scaffold(
          body: Center(child: Text("Loading...")),
        );
      }
  });
}

void _navigating(BuildContext context, int index) {
      Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => 
                    DetailPage(index),
                ));
}
}