import 'package:gokz/intro/login_signup_page.dart';
import 'package:gokz/main.dart';
import 'package:gokz/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int cardNumber = 0;
  @override
  void initState() {
    cardNumber = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height*.06,
          ),
          Container(
            width: double.infinity,
            height: height*.78,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow:[ 
                BoxShadow(
                        color: const Color.fromARGB(255, 170, 196, 217).withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 7,
                        offset: const Offset(0, 5),
              )
              ]
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 102,
                  width: 102,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/ava.png"))
                  ),
                ),
                const Gap(15),
                Text("Welcome to", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w500),),
                Text("Mr Bildspace!", style: Styles.headlineStyle1.copyWith(color: Colors.orange.shade300, fontSize: 30),),
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                  child:InkWell(
                    hoverColor:Colors.orange.shade300,
                  onTap: () {
                    setState(() {
                      cardNumber = 0;
                    });
                  },
                  child: Text('Account', style: Styles.headLineStyle3.copyWith(color:Colors.grey.shade400, fontWeight: FontWeight.w400),),
                  ),
                ),
                Container(
                  child:InkWell(
                    hoverColor:Colors.orange.shade300 ,
                  onTap: () {setState(() {
                    cardNumber = 1;
                  });
                  },
                  child: Text('Business', style: Styles.headLineStyle3.copyWith(color:Colors.grey.shade400, fontWeight: FontWeight.w400),),
                  ),
                ),
                Container(
                  child:InkWell(
                    hoverColor:Colors.orange.shade300 ,
                  onTap: () {
                    setState(() {
                    cardNumber = 3;
                  });
                  },
                  child: Text('Policy', style: Styles.headLineStyle3.copyWith(color:Colors.grey.shade400, fontWeight: FontWeight.w400),),
                  ),
                ),
                  ],
                ),
                const Gap(20),
                cards(cardNumber, width)
                // Text(user?.email ?? "nouser")
              ],
            ),
            ),
            Container(
              padding: const EdgeInsets.only(top:10, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(Icons.logout_outlined, color: Colors.grey, size: 30,),
                    onTap: (() {
                        logout();
                         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        const LoginSignup()), (Route<dynamic> route) => false);

                    }),

                  ),
                  Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffC04757),
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: InkWell(
                            child: Text("Edit Profile", style: Styles.headLineStyle3.copyWith(color: Colors.white),), 
                            onTap: (() {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                             const EditProfile()), (Route<dynamic> route) => false);
                            }
                          ),
                        )
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

  void logout() {
    final user = FirebaseAuth.instance.signOut();
  }

  Widget cards(int cardNumber, double width){
    final user = FirebaseAuth.instance.currentUser;
    if(cardNumber == 0){
      return Column(
        children: [
          Container(
                    height: 50,
                    width: width*.8,
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffF8F7FE)
                    ),
                    child: Text(user?.displayName ?? "No name", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                  ),
                  const Gap(15),
                Container(
                    height: 50,
                    width: width*.8,
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffF8F7FE)
                    ),
                    child: Text(user?.email ?? "", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                  ),
                  const Gap(15),
                  Container(
                    height: 50,
                    width: width*.8,
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffF8F7FE)
                    ),
                      child: Text(user?.emailVerified== true?"Verified":"Not Verified", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                    
                  ),
        ],
      );
    }
      else if(cardNumber == 1){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("CARD HOLDER", style: Styles.cardTextStyle),
          Container(
                    height: 50,
                    width: width*.8,
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffF8F7FE)
                    ),
                    child: const Text("Tolebay Arsen", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                  ),
                  const Gap(15),
                Text("CARD NUMBER", style: Styles.cardTextStyle),
                Container(
                    height: 50,
                    width: width*.8,
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffF8F7FE)
                    ),
                    child: const Text("7777 7777 7777 7777", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                  ),
                  const Gap(15),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("VALID UNTIL", style: Styles.cardTextStyle),
                          Container(
                    height: 50,
                    width: width*.38,
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffF8F7FE)
                    ),
                    child: const Text("77/7777", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                  ),
                        ],
                      ),
                  const Gap(15),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text("CVV", style: Styles.cardTextStyle,),
                      Container(
                        height: 50,
                        width: width*.38,
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffF8F7FE)
                        ),
                          child: const Text("***", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                        
                      ),
                    ],
                  ),
                    ],
                  )
        ],
      );
      }
      else{
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Privacy & Policy", style: Styles.headLineStyle3,),
              const Gap(20),
              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", style: Styles.headLineStyle4.copyWith(fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis, maxLines: 6),
              const Gap(20),
              Row(children: [
                const Text("• ", style: TextStyle(color: Color(0xff0D9BB2), fontSize: 25),),
                Text("bildspace@info.com", style: Styles.headLineStyle3.copyWith(fontSize: 13),),
              ],),
              Row(children: [
                const Text("• ", style: TextStyle(color: Color(0xff0D9BB2), fontSize: 25),),
                Text("+7 (767) 777 87 97", style: Styles.headLineStyle3.copyWith(fontSize: 13),),
              ],),
              Row(children: [
                const Text("• ", style: TextStyle(color: Color(0xff0D9BB2), fontSize: 25),),
                Text("All rights reserved", style: Styles.headLineStyle3.copyWith(fontSize: 13),),
              ],)
            ],
          ),
        );
      };
    }
    
}
