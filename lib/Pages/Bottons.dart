import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Model/model.dart';
import 'package:frontend/Screens/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();
  Uint8List? _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.userModel = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 24, 32, 1),
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 600.0) {
                return _buildWideLayout(context);
              } else {
                return _buildMobileLayout(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(24, 24, 32, 1),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              width: 400,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 80.0,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 80.0,
                          backgroundImage: AssetImage("assets/avatar.jpg"),
                        ),

                  Positioned(
                    child: IconButton(
                        iconSize: 30,
                        color: Colors.blueAccent,
                        onPressed: selectImage,
                        icon: Icon(Icons.add_a_photo)),
                    bottom: -5,
                    left: 80,
                  ),
                  SizedBox(height: 10.0),
                  // ProfileInfoFormField(
                  //     label: 'First Name', initialText: "Gopi"),
                  // ProfileInfoFormField(
                  //     label: 'Second Name', initialText: "Krishna"),
                  // ProfileInfoFormField(
                  //     label: 'Email', initialText: "gopikanna89654@gmail.com"),
                  ListTile(
                      title: const Text("Account Id"),
                      subtitle: Text("${userModel.uid}"),
                      leading: Icon(
                        Ionicons.person_add_outline,
                        color: Colors.red,
                      ),
                      tileColor: Colors.green),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      title: const Text("FirstName"),
                      subtitle: Text("${userModel.firstName}"),
                      leading: Icon(
                        Ionicons.person_outline,
                        color: Colors.red,
                      ),
                      tileColor: Colors.green),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      title: const Text("SecondName"),
                      subtitle: Text("${userModel.secondName}"),
                      leading: Icon(
                        Ionicons.person_outline,
                        color: Colors.red,
                      ),
                      tileColor: Colors.green),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      title: const Text("Email"),
                      subtitle: Text("${userModel.email}"),
                      leading: Icon(
                        Ionicons.mail_sharp,
                        color: Colors.red,
                      ),
                      tileColor: Colors.green),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(24, 24, 32, 1),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              width: 400,
              padding: EdgeInsets.all(16.0),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   boxShadow: [
              //     BoxShadow(
              //       //color: Colors.grey.withOpacity(0.5),
              //       spreadRadius: 5,
              //       blurRadius: 7,
              //       offset: Offset(0, 3),
              //     ),
              //   ],
              //   borderRadius: BorderRadius.circular(15.0),
              // ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 80.0,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 80.0,
                          backgroundImage: AssetImage("assets/avatar.jpg"),
                        ),

                  Positioned(
                    child: IconButton(
                        iconSize: 30,
                        color: Colors.blueAccent,
                        onPressed: selectImage,
                        icon: Icon(Icons.add_a_photo)),
                    bottom: -5,
                    left: 80,
                  ),
                  SizedBox(height: 10.0),
                  // ProfileInfoFormField(
                  //     label: 'First Name', initialText: "Gopi"),
                  // ProfileInfoFormField(
                  //     label: 'Second Name', initialText: "Krishna"),
                  // ProfileInfoFormField(
                  //     label: 'Email', initialText: "gopikanna89654@gmail.com"),
                  ListTile(
                      title: const Text("Account Id"),
                      subtitle: Text("${userModel.uid}"),
                      leading: Icon(
                        Ionicons.person_add_outline,
                        color: Colors.red,
                      ),
                      tileColor: Colors.green),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      title: const Text("FirstName"),
                      subtitle: Text("${userModel.firstName}"),
                      leading: Icon(
                        Ionicons.person_outline,
                        color: Colors.red,
                      ),
                      tileColor: Colors.green),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      title: const Text("SecondName"),
                      subtitle: Text("${userModel.secondName}"),
                      leading: Icon(
                        Ionicons.person_outline,
                        color: Colors.red,
                      ),
                      tileColor: Colors.green),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      title: const Text("Email"),
                      subtitle: Text("${userModel.email}"),
                      leading: Icon(
                        Ionicons.mail_sharp,
                        color: Colors.red,
                      ),
                      tileColor: Colors.green),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
