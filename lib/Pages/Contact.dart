import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          //padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
        body: SingleChildScrollView(
            child: Center(
      child: Container(
        width: 900,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const Text(
              "Contact Us",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.redAccent),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,
                    indent: 10,
                  ),
                ),
                SizedBox(width: 10), // Adjust the width of the space
                Icon(
                  Ionicons.heart,
                  color: Colors.blue,
                  size: 30,
                ),
                // Text or any other widget you want in the middle
                SizedBox(width: 10), // Adjust the width of the space
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,
                    endIndent: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Center(
              child: Container(
                width: 500,
                height: 1100,
                padding: const EdgeInsets.all(25),
                // decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //         begin: Alignment.topLeft,
                //         end: Alignment.topRight,
                //         colors: [
                //       Colors.blue,
                //       Colors.grey,
                //       Colors.purple,
                //     ])),
                child: const Column(
                  children: <Widget>[
                    Icon(
                      Iconsax.location,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Office Address",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "911-912, Ghanshyam Enclave, New Link Rd, Lalji Pada, Kandivali (E), Mumbai, Maharashtra 400067",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.mail,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Mail Id",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "info@trivoli.in",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.phone,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Phone No",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "+91 - 9920518145",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "+91 - 8291919910",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Image(
                      image: AssetImage(
                        "assets/location.jpg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Container(
          width: 500,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Text(
                "Contact Us",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.redAccent),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                      indent: 10,
                    ),
                  ),
                  SizedBox(width: 10), // Adjust the width of the space
                  Icon(
                    Ionicons.heart,
                    color: Colors.blue,
                    size: 30,
                  ),
                  // Text or any other widget you want in the middle
                  SizedBox(width: 10), // Adjust the width of the space
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: 350,
                height: 900,
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                      Colors.blue,
                      Colors.grey,
                      Colors.purple,
                    ])),
                child: const Column(
                  children: <Widget>[
                    Icon(
                      Iconsax.location,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Office Address",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "911-912, Ghanshyam Enclave, New Link Rd, Lalji Pada, Kandivali (E), Mumbai, Maharashtra 400067",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.mail,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Mail Id",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "info@trivoli.in",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.phone,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Phone No",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "+91 - 9920518145",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      "+91 - 8291919910",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Image(
                      image: AssetImage(
                        "assets/location.jpg",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
