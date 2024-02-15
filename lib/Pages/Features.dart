import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class FeaturesPage extends StatefulWidget {
  const FeaturesPage({super.key});

  @override
  State<FeaturesPage> createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
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
          //color: Colors.yellowAccent,
          width: 900,

          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                "Features",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.redAccent),
              ),
              SizedBox(height: 8),
              Row(
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
              SizedBox(height: 15),
              Image(
                image: AssetImage(
                  "assets/download1.gif",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Beautiful Business Products Templates - Elegant & Unique themes suiting your profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Choose your Digital Business Products from our various business products templates. All Digital Card’s templates are designed keeping in mind the requirements of all industries, professions and business needs.Share your contact information instantly and easily with a tap or scan, no need to fumble with physical cards.Create a digital business card that reflects your personal brand or company identity. You can use your own colors, logo, and fonts to make it memorable.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Beauty with Brain",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Image(
                image: AssetImage(
                  "assets/goldenrules.gif",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "All digital business products templates are fully responsive on all devices including desktops, laptops, tablets and mobile phones. One click and you are there.All business card templates are not just beautiful and eye catching, but they also have most interactive, actionable and intelligent lead generation features like click to call, whatsapp without saving number, send email, add contact to phone address book, social links and more features.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            //color: Colors.yellowAccent,
            width: 500,

            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Text(
                  "Features",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.redAccent),
                ),
                SizedBox(height: 8),
                Row(
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
                SizedBox(height: 15),
                Image(
                  image: AssetImage(
                    "assets/download1.gif",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Beautiful Business Products Templates - Elegant & Unique themes suiting your profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Choose your Digital Business Products from our various business products templates. All Digital Card’s templates are designed keeping in mind the requirements of all industries, professions and business needs.Share your contact information instantly and easily with a tap or scan, no need to fumble with physical cards.Create a digital business card that reflects your personal brand or company identity. You can use your own colors, logo, and fonts to make it memorable.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Beauty with Brain",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Image(
                  image: AssetImage(
                    "assets/goldenrules.gif",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "All digital business products templates are fully responsive on all devices including desktops, laptops, tablets and mobile phones. One click and you are there.All business card templates are not just beautiful and eye catching, but they also have most interactive, actionable and intelligent lead generation features like click to call, whatsapp without saving number, send email, add contact to phone address book, social links and more features.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
