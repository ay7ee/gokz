import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:gokz/main.dart';
import 'package:gokz/screens/profile_page.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/styles.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final TextEditingController _displayName;
  final user = FirebaseAuth.instance.currentUser;
  XFile? file;

  @override
  void initState() {
    _displayName = TextEditingController();
    file = null;
    super.initState();
  }

  @override
  void dispose() {
    _displayName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(

        children: [
          SizedBox(
            height: height*0.1,),
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
              ),
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Icon(Icons.arrow_back),
                    onTap: ((){
                      Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: (context) => Intro()));
                    }),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.red,
                        image: DecorationImage(image: NetworkImage(user?.photoURL==null?"https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg" :"${user?.photoURL}"), fit: BoxFit.cover)
                        ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey,
                        ),
                        child: InkWell(
                          onTap: (() async {
                            ImagePicker imagePicker = ImagePicker();
                            XFile? file1 = await imagePicker.pickImage(source: ImageSource.gallery);
                            setState(() {
                              file = file1;
                            });
                          }),
                          child: Icon(Icons.camera_alt_rounded,),
                        ),
                    ),
                    ]
                  ),
                  const Gap(30),
                  Text("Username"),
                  const Gap(8),
                  Container(
                      height: 50,
                      width: width*.85,
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffF8F7FE)
                      ),
                      child:  TextField(
                        controller: _displayName,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: user?.displayName,
                            ),
                      ),
                    ),
                  const Gap(20),
                  Text("Email"),
                  const Gap(8),
                    Container(
                      height: 50,
                      width: width*.85,
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffF8F7FE)
                      ),
                      child:  TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: user?.email,
                            ),
                      ),
                    ),
                    const Gap(50),
                    InkWell(
                      child: Center(
                        child: Container(
                              width: width*.3,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xffC04757),
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child:  Center(child: Text("Save", style: Styles.headLineStyle3.copyWith(color: Colors.white,),)), 
                              ),
                      ),
                      onTap:(()async{
                        if(file != null){
                          try{
                            FirebaseAuth.instance.currentUser?.updatePhotoURL(file.toString());
                          } on FirebaseAuthException catch(e){
                          }
                        }
                         try{
                            FirebaseAuth.instance.currentUser?.updateDisplayName(_displayName.text);
                          } on FirebaseAuthException catch(e){
                          }
                      }),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}