import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gokz/firebase_options.dart';
import 'package:gokz/main.dart';

import '../utils/styles.dart';
import 'main_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool passwordVisible = false;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    passwordVisible = false;
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
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
         FutureBuilder(
          future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
          builder: ((context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.done:
               return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Center(
               child: Container(
                height: height*.7,
                 child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', )),
                      Container(
                        height: height*0.2,
                        width: width*0.67,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/signin_image.png'), fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        width:width*.75,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: _email,
                          decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your Email",),
                        ),
                      ),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [Container(
                              width:width*.75,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                controller: _password,
                                obscureText: true,
                                decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Your Password",
                                ),
                          
                              ),
                              ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: InkWell(
                                  child: Text("Forgot?", style: Styles.headLineStyle4.copyWith(fontWeight: FontWeight.w300),),
                                  onTap:(){},
                              ),
                                ),  
                        ]),

                        ],
                      ),
                        Container( 
                        height: 45,
                        child: Center(
                          child: TextButton(
                              onPressed: (() async{
                                final email = _email.text;
                                final password = _password.text;
                                try{
                                await FirebaseAuth.instance.signInWithEmailAndPassword( email: email, password: password);
                                Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: (context) => Home()));
                                } on FirebaseAuthException catch(e){
                              }
                              }),
                              child: Text( 'SIGN IN', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500))
                              ), 
                        ),
                        width:width*.75,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Color(0xffC04757),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        )
      
                    ],
                  ),
               ),
             ),
           ],
         );
           default:
           return Text("Loading...");
            }
          }),
         ),
      ]),
    );
  }
}