import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gokz/firebase_options.dart';
import 'package:gokz/screens/sign_in_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool passwordVisible = false;
  String? errorCode;


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
                  height: height*.5,
                   child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', )),
                        ),
                        Container(
                          width:width*.75,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            controller: _email,
                            decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Your Email",),
                          ),
                        ),
                        const Gap(20),
                        Container(
                                width:width*.75,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child:TextFormField(
                                  controller: _password,
                                  autocorrect: false,
                                  obscureText: !passwordVisible,
                                  decoration: InputDecoration(
                                      hintText: 'Your password',
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(icon: Icon(passwordVisible? Icons.visibility: Icons.visibility_off,color: Colors.grey, size: 20,),
                                      onPressed: () {
                                        setState(() {
                                          passwordVisible = !passwordVisible;
                                        });
                                      },),
            ),
                 ),
                                ), 
                                const Gap(20),
                          Container( 
                          height: 45,
                          child: Center(
                            child: TextButton(
                              onPressed: () async{
                                final email = _email.text;
                                final password = _password.text;
                                try{
                                await FirebaseAuth.instance.createUserWithEmailAndPassword( email: email, password: password);  
                                Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: (context) => SignIn()));
                                }on FirebaseAuthException catch(e){
                                    setState(() {
                                      errorCode = e.code;
                                    });
                                  
                                }
                              },
                              child: Text( 'SIGN UP', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500))
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