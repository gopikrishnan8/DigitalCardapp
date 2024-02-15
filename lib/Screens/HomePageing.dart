import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Model/model.dart';
import 'package:frontend/Pages/Contact.dart';
import 'package:frontend/Pages/Features.dart';
//import 'package:frontend/Pages/Gallery.dart';
import 'package:frontend/Pages/Products.dart';

class HomePageing extends StatefulWidget {
  const HomePageing({super.key});

  @override
  State<HomePageing> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePageing> {
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
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          centerTitle: true,
          title: const Text('Bussiness Card App'),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              //color: Colors.yellowAccent,
              width: 800,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  const Image(
                    image: AssetImage(
                      "assets/image_1.gif",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "About Us",
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
                        ),
                      ),
                      SizedBox(width: 10), // Adjust the width of the space
                      Icon(
                        Icons.grade,
                        color: Colors.blue,
                        size: 30,
                      ),
                      // Text or any other widget you want in the middle
                      SizedBox(width: 10), // Adjust the width of the space
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "How convenient and expedient would it be if all your content & information is designed professionally that can help you stand out from the crowd and make your first impression remarkable. Digital is the new trend. Keeping yourself right up with the trend is what one must do. At My Digital Card we take to a different next level where you can Brand yourself in a unique way. We have set of services that can be helpful for you, your employees and for your Brand. Sharing contact information becomes effortless. Simply tap your phone on someone else's digit card, and their details are instantly saved. No more fumbling with crumpled cards or deciphering illegible handwriting.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Why Digital?",
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
                        ),
                      ),
                      SizedBox(width: 10), // Adjust the width of the space
                      Icon(
                        Icons.grade,
                        color: Colors.blue,
                        size: 30,
                      ),
                      // Text or any other widget you want in the middle
                      SizedBox(width: 10), // Adjust the width of the space
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Edit your information effortlessly in real-time, ensuring contacts always have your latest details. No need to reprint cards due to typos or career changes.Track engagement with your digital card, gaining valuable insights into your networking effectiveness and identifying potential connections. Measure the impact of your interactions and optimize your networking strategy.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 500,
                    height: 900,
                    padding: EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [
                          .1,
                          .2,
                          .3,
                          .4
                        ],
                            colors: [
                          Colors.deepPurple,
                          Colors.grey,
                          Colors.yellow,
                          Colors.cyanAccent
                        ])),
                    child: Column(
                      children: [
                        const Text(
                          "Our Services",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.red),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Image(image: AssetImage("assets/cards.gif")),
                        const SizedBox(
                          height: 15,
                        ),
                        ListView(
                          shrinkWrap: true,
                          children: const <Widget>[
                            Text(
                              "We aren't just virtual versions of paper rectangles; they're comprehensive hubs for networking success. Here's what they offer: Effortless Sharing:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "1) Ditch the fumbling! Share your digital card instantly with a tap or scan, accessible anytime, anywhere. No more worrying about lost or crumpled paper cards.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "2) Go beyond name and number. Include links to your website, social media, portfolio, or even booking system, showcasing your expertise and value proposition.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "3)  Reduce paper waste and align with sustainability goals. Business card apps offer a greener alternative, contributing to a positive environmental impact.",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "4) Keep your information fresh and accurate. Edit details on the fly, ensuring contacts always have your latest info. No more outdated printed cards causing frustration.",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        ElevatedButton.icon(
                          icon: Text("Explore Our ProductPage",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          label: Icon(
                            Icons.forward,
                            size: 30,
                            color: Colors.red,
                          ),
                          onPressed: () => {
                            Fluttertoast.showToast(
                                msg: "you moved to productpage"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage()))
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "FAQ",
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
                        ),
                      ),
                      SizedBox(width: 10), // Adjust the width of the space
                      Icon(
                        Icons.grade,
                        color: Colors.blue,
                        size: 30,
                      ),
                      // Text or any other widget you want in the middle
                      SizedBox(width: 10), // Adjust the width of the space
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const ExpansionTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/personalimage.avif"),
                    ),
                    title: Text("What is Digital Products?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    children: [
                      Text(
                          "Digital products are any goods or services that exist in a non-physical, electronic format. You can't hold them in your hand, but you can access and use them through your computer, phone, or other devices.",
                          style: TextStyle(fontSize: 17)),
                    ],
                    childrenPadding: EdgeInsets.all(30),
                    collapsedTextColor: Colors.red,
                    backgroundColor: Colors.lightBlue,
                    iconColor: Colors.red,
                    textColor: Colors.white,
                  ),
                  const ExpansionTile(
                    leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/personalimage.avif")),
                    title: Text("From whom is Digital Products?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    children: [
                      Text(
                          "Be a small scale business or a large scale business. It can be used by Business Owners & Entrepreneurs or Professionals like Architect, CA, Consultant, Digital Marketer, Real Estate Agent, Insurance Advisor, Artist, Services & more. , so if you want to impress the people you meet and put a face to your details - you came to the right place.",
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                    ],
                    childrenPadding: EdgeInsets.all(30),
                    collapsedTextColor: Colors.red,
                    backgroundColor: Colors.lightBlue,
                    iconColor: Colors.red,
                    textColor: Colors.white,
                  ),
                  const ExpansionTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB0a9Vv--jOowQtVo_DNHzY7CvSizocuT8pA&usqp=CAU')),
                    title: Text("Can I create Multiple Products?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    children: [
                      Text(
                        "Yes, you can definitely create multiple products in digital cards! There are multiple ways to interpret your question. If you have multiple designs for the same type of digital card (e.g., birthday cards, holiday cards), you can offer them as variations within a single product listing. Each variation would showcase a different design and potentially have a different price or customization options.",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ],
                    childrenPadding: EdgeInsets.all(30),
                    collapsedTextColor: Colors.red,
                    backgroundColor: Colors.lightBlue,
                    iconColor: Colors.red,
                    textColor: Colors.white,
                  ),
                  const ExpansionTile(
                    leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/personalimage.avif")),
                    title: Text("How can i share my Digital Products?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    children: [
                      Text(
                          "There are several ways to share your digital products, depending on what type of product it is and how you want to distribute it.Email,Download Links,MarketPlaces,Membership Sites and Streaming Services",
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                    ],
                    childrenPadding: EdgeInsets.all(30),
                    collapsedTextColor: Colors.red,
                    backgroundColor: Colors.lightBlue,
                    iconColor: Colors.red,
                    textColor: Colors.white,
                  ),
                  const ExpansionTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB0a9Vv--jOowQtVo_DNHzY7CvSizocuT8pA&usqp=CAU')),
                    title: Text(
                        "How Digital Products will help us market ourselves and reach new customers?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    children: [
                      Text(
                          "Digital products hold a lot of potential when it comes to marketing yourself and reaching new customers. Compared to traditional marketing methods, digital products can be much more affordable to create and distribute. You don't have to worry about printing costs, physical inventory, or shipping fees. Additionally, once created, they can be easily scaled to reach a larger audience without incurring significant additional costs.",
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                    ],
                    childrenPadding: EdgeInsets.all(30),
                    collapsedTextColor: Colors.red,
                    backgroundColor: Colors.lightBlue,
                    iconColor: Colors.red,
                    textColor: Colors.white,
                  ),
                  const ExpansionTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/personalimage.avif"),
                    ),
                    title: Text("Is it Safe,Will you Spam me?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    children: [
                      Text(
                          "Your data is your data. We will never sell or share your data. We provide enterprise level security & privacy practices to make sure we keep it this way.",
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                    ],
                    childrenPadding: EdgeInsets.all(30),
                    collapsedTextColor: Colors.red,
                    backgroundColor: Colors.lightBlue,
                    iconColor: Colors.red,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          centerTitle: true,
          title: const Text('Bussiness Card App'),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Container(
            //color: Colors.yellowAccent,
            width: 500,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const Image(
                  image: AssetImage(
                    "assets/image_1.gif",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "About Us",
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
                      ),
                    ),
                    SizedBox(width: 10), // Adjust the width of the space
                    Icon(
                      Icons.grade,
                      color: Colors.blue,
                      size: 30,
                    ),
                    // Text or any other widget you want in the middle
                    SizedBox(width: 10), // Adjust the width of the space
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "How convenient and expedient would it be if all your content & information is designed professionally that can help you stand out from the crowd and make your first impression remarkable. Digital is the new trend. Keeping yourself right up with the trend is what one must do. At My Digital Card we take to a different next level where you can Brand yourself in a unique way. We have set of services that can be helpful for you, your employees and for your Brand. Sharing contact information becomes effortless. Simply tap your phone on someone else's digit card, and their details are instantly saved. No more fumbling with crumpled cards or deciphering illegible handwriting.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Why Digital?",
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
                      ),
                    ),
                    SizedBox(width: 10), // Adjust the width of the space
                    Icon(
                      Icons.grade,
                      color: Colors.blue,
                      size: 30,
                    ),
                    // Text or any other widget you want in the middle
                    SizedBox(width: 10), // Adjust the width of the space
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "Edit your information effortlessly in real-time, ensuring contacts always have your latest details. No need to reprint cards due to typos or career changes.Track engagement with your digital card, gaining valuable insights into your networking effectiveness and identifying potential connections. Measure the impact of your interactions and optimize your networking strategy.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 500,
                  height: 900,
                  padding: EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [
                        .1,
                        .2,
                        .3,
                        .4
                      ],
                          colors: [
                        Colors.deepPurple,
                        Colors.grey,
                        Colors.yellow,
                        Colors.cyanAccent
                      ])),
                  child: Column(
                    children: [
                      const Text(
                        "Our Services",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.red),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Image(image: AssetImage("assets/cards.gif")),
                      const SizedBox(
                        height: 15,
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: const <Widget>[
                          Text(
                            "We aren't just virtual versions of paper rectangles; they're comprehensive hubs for networking success. Here's what they offer: Effortless Sharing:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "1) Ditch the fumbling! Share your digital card instantly with a tap or scan, accessible anytime, anywhere. No more worrying about lost or crumpled paper cards.",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "2) Go beyond name and number. Include links to your website, social media, portfolio, or even booking system, showcasing your expertise and value proposition.",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "3)  Reduce paper waste and align with sustainability goals. Business card apps offer a greener alternative, contributing to a positive environmental impact.",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "4) Keep your information fresh and accurate. Edit details on the fly, ensuring contacts always have your latest info. No more outdated printed cards causing frustration.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton.icon(
                        icon: Text("Explore Our ProductPage",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        label: Icon(
                          Icons.forward,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () => {
                          Fluttertoast.showToast(
                              msg: "you moved to productpage"),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage()))
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "FAQ",
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
                      ),
                    ),
                    SizedBox(width: 10), // Adjust the width of the space
                    Icon(
                      Icons.grade,
                      color: Colors.blue,
                      size: 30,
                    ),
                    // Text or any other widget you want in the middle
                    SizedBox(width: 10), // Adjust the width of the space
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const ExpansionTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB0a9Vv--jOowQtVo_DNHzY7CvSizocuT8pA&usqp=CAU')),
                  title: Text("What is Digital Products?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  children: [
                    Text(
                        "Digital products are any goods or services that exist in a non-physical, electronic format. You can't hold them in your hand, but you can access and use them through your computer, phone, or other devices.",
                        style: TextStyle(fontSize: 17)),
                  ],
                  childrenPadding: EdgeInsets.all(30),
                  collapsedTextColor: Colors.red,
                  backgroundColor: Colors.lightBlue,
                  iconColor: Colors.red,
                  textColor: Colors.white,
                ),
                const ExpansionTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/personalimage.avif"),
                  ),
                  title: Text("From whom is Digital Products?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  children: [
                    Text(
                        "Be a small scale business or a large scale business. It can be used by Business Owners & Entrepreneurs or Professionals like Architect, CA, Consultant, Digital Marketer, Real Estate Agent, Insurance Advisor, Artist, Services & more. , so if you want to impress the people you meet and put a face to your details - you came to the right place.",
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                  ],
                  childrenPadding: EdgeInsets.all(30),
                  collapsedTextColor: Colors.red,
                  backgroundColor: Colors.lightBlue,
                  iconColor: Colors.red,
                  textColor: Colors.white,
                ),
                const ExpansionTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/personalimage.avif"),
                  ),
                  title: Text("Can I create Multiple Products?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  children: [
                    Text(
                      "Yes, you can definitely create multiple products in digital cards! There are multiple ways to interpret your question. If you have multiple designs for the same type of digital card (e.g., birthday cards, holiday cards), you can offer them as variations within a single product listing. Each variation would showcase a different design and potentially have a different price or customization options.",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ],
                  childrenPadding: EdgeInsets.all(30),
                  collapsedTextColor: Colors.red,
                  backgroundColor: Colors.lightBlue,
                  iconColor: Colors.red,
                  textColor: Colors.white,
                ),
                const ExpansionTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/personalimage.avif"),
                  ),
                  title: Text("How can i share my Digital Products?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  children: [
                    Text(
                        "There are several ways to share your digital products, depending on what type of product it is and how you want to distribute it.Email,Download Links,MarketPlaces,Membership Sites and Streaming Services",
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                  ],
                  childrenPadding: EdgeInsets.all(30),
                  collapsedTextColor: Colors.red,
                  backgroundColor: Colors.lightBlue,
                  iconColor: Colors.red,
                  textColor: Colors.white,
                ),
                const ExpansionTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB0a9Vv--jOowQtVo_DNHzY7CvSizocuT8pA&usqp=CAU')),
                  title: Text(
                      "How Digital Products will help us market ourselves and reach new customers?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  children: [
                    Text(
                        "Digital products hold a lot of potential when it comes to marketing yourself and reaching new customers. Compared to traditional marketing methods, digital products can be much more affordable to create and distribute. You don't have to worry about printing costs, physical inventory, or shipping fees. Additionally, once created, they can be easily scaled to reach a larger audience without incurring significant additional costs.",
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                  ],
                  childrenPadding: EdgeInsets.all(30),
                  collapsedTextColor: Colors.red,
                  backgroundColor: Colors.lightBlue,
                  iconColor: Colors.red,
                  textColor: Colors.white,
                ),
                const ExpansionTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/personalimage.avif"),
                  ),
                  title: Text("Is it Safe,Will you Spam me?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  children: [
                    Text(
                        "Your data is your data. We will never sell or share your data. We provide enterprise level security & privacy practices to make sure we keep it this way.",
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                  ],
                  childrenPadding: EdgeInsets.all(30),
                  collapsedTextColor: Colors.red,
                  backgroundColor: Colors.lightBlue,
                  iconColor: Colors.red,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();
  Uint8List? image;

  @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.userModel = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

  // void selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     image = img;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // Future<void> logout(BuildContext context) async {
    //   await FirebaseAuth.instance.signOut();
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => LoginPage()));
    // }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Gopi Krishnan"),
            accountEmail: Text("7395911863"),
            currentAccountPicture: ClipOval(
              child: image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(image!),
                    )
                  : const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/256/4315/4315730.png"),
                    ),
            ),
          ),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(
              "Products",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.production_quantity_limits,
                color: Colors.lightGreen),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductPage()));
            },
          ),
          ListTile(
            title: const Text(
              "Features",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.featured_play_list, color: Colors.amber),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeaturesPage()));
            },
          ),
          // ListTile(
          //   title: const Text(
          //     "Settings",
          //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          //   ),
          //   leading: const Icon(Iconsax.setting_2, color: Colors.indigo),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const Setting()));
          //   },
          // ),
          ListTile(
            title: const Text(
              "Contact",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.contact_emergency, color: Colors.blue),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactPage()));
            },
          ),
          // TextButton.icon(
          //   icon: Icon(Icons.logout),
          //   onPressed: () {
          //     logout(context);
          //   },
          //   label: const Text(
          //     "Logout",
          //     style: TextStyle(
          //       fontSize: 16, // Adjust font size as needed
          //       color: Colors.black, // Customize text color
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
