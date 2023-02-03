import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

import '../main.dart';
import '../screens/sign_in_page.dart';
import '../screens/sign_up_page.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/image4.png'), fit: BoxFit.cover)
          ),
        ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Center(
                child: RichText(
                 textAlign: TextAlign.center, 
                 text: const TextSpan(
                  children: <TextSpan>[
                  TextSpan(text: "Let's Enjoy Make your\n", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', )),
                  TextSpan(text: 'Dream vacation!', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', backgroundColor: Color(0xffC04757))),
                ],
  ),
),
              ),
              const Gap(30),
              Container(
                height: height*0.05,
                width: width*.45,
                decoration: BoxDecoration(
                      color: Color(0xffFFB85A),
                      borderRadius: BorderRadius.circular(5)
                    ),
                child: Center(
                  child: InkWell(
                    child: Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'RobotoMono',),) ,
                    onTap: (() { Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(builder: (context) => SignIn()));}),
                    ),
                ),
              ),
              const Gap(20),
              Container(
                height: height*0.05,
                width: width*.45,
                decoration: BoxDecoration(
                      color: Color(0xffC04757),
                      borderRadius: BorderRadius.circular(5)
                    ),
                child: Center(
                  child: InkWell(
                    child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'RobotoMono',),) ,
                    onTap: (() {
                          Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(builder: (context) => SignUp()));
                    }),
                    ),
                ),
              ),
              ],
            ),
        ]
      ),
    );
  }
}