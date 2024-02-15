// ignore_for_file: unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Screens/Login_screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

final Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController forgetPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        // appBar: AppBar(
        //   // backgroundColor: Colors.lightBlue,
        //   elevation: 0,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.red,
        //     ),
        //     onPressed: () {
        //       // passing this to our root
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
        body: SafeArea(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg1.png'),
                      fit: BoxFit.cover) // Add rounded corners
                  // Set container background color
                  ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= 600.0) {
                    return buildWideLayout(context);
                  } else {
                    return buildMobileLayout(context);
                  }
                },
              ),
            ),
          ),
        ));
  }

  Widget buildWideLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400.0,
          margin: EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 290,
                child: Image.asset("assets/forgetpassword.jpg"),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.white,
                child: TextFormField(
                  controller: forgetPasswordController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    hintText: "Enter Your Email Here!",
                    //enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                color: Colors.redAccent,
                child: MaterialButton(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: 200,
                  onPressed: () async {
                    var forgotEmail = forgetPasswordController.text.trim();
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: forgotEmail)
                          .then((value) => {
                                print("Email sent successfully"),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage())),
                              });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Email sent successfully'),
                      ));
                    } on FirebaseAuthException catch (e) {
                      print('Error $e');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Error uploading file: $e'),
                      ));
                    }
                  },
                  child: const Text(
                    "Forget Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 500,
        margin: EdgeInsets.symmetric(vertical: 180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 250,
                child: Image.asset("assets/forgetpassword.jpg"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.white,
              child: TextFormField(
                controller: forgetPasswordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded),
                  hintText: "Enter Your Email Here!",
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              color: Colors.redAccent,
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                minWidth: 200,
                onPressed: () async {
                  var forgotEmail = forgetPasswordController.text.trim();
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: forgotEmail)
                        .then((value) => {
                              print("Email sent successfully"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage())),
                            });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Email sent successfully'),
                    ));
                  } on FirebaseAuthException catch (e) {
                    print('Error $e');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Error uploading file: $e'),
                    ));
                  }
                },
                child: const Text(
                  "Forget Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
