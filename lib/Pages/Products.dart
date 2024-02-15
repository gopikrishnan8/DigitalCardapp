import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Pages/busnesscardpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final imgList = [
    Image.asset("assets/BUSSINESSCARDS.gif"),
    Image.asset("assets/makeeasy.gif"),
    Image.asset("assets/slidercard.gif")
  ];
  int myCurrentIndex = 0;

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              width: 800,
              //color: Color.fromARGB(255, 129, 238, 238),
              child: Column(
                children: [
                  Text(
                    "Our Products",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 2000),
                      autoPlayInterval: const Duration(seconds: 6),
                      height: 500,
                      aspectRatio: 3.0,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      },
                    ),
                    items: imgList,
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: myCurrentIndex,
                    count: imgList.length,
                    effect: WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 10,
                        activeDotColor: Colors.grey.shade900,
                        paintStyle: PaintingStyle.fill),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    " Digital Bussiness Cards",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                          indent: 20,
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
                          endIndent: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Digital business cards, also known as electronic business cards or vCards, are virtual versions of traditional paper business cards. They contain your contact information, such as your name, job, company name, email address, website, phone number, and social media profiles, and can be shared electronically.They eliminate the need for paper and printing, which can help reduce your environmental impact.They are typically cheaper than traditional paper business cards, especially when you factor in the cost of printing and design.You can share them instantly via email, text message, social media, or by using a QR code.",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    icon: const Text("View Sample Cards",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    label: const Icon(
                      Icons.forward,
                      size: 30,
                      color: Colors.red,
                    ),
                    onPressed: () => {
                      Fluttertoast.showToast(
                          msg: "you moved to bussiness card page"),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BusinessPage(),
                          ))
                    },
                  )
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
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 500,

            //color: Color.fromARGB(255, 129, 238, 238),
            child: Column(
              children: [
                const Text(
                  "Our Products",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 2000),
                    autoPlayInterval: const Duration(seconds: 6),
                    height: 200,
                    aspectRatio: 3.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        myCurrentIndex = index;
                      });
                    },
                  ),
                  items: imgList,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: myCurrentIndex,
                  count: imgList.length,
                  effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 10,
                      activeDotColor: Colors.grey.shade900,
                      paintStyle: PaintingStyle.fill),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  " Digital Bussiness Cards",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                        indent: 20,
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
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "Digital business cards, also known as electronic business cards or vCards, are virtual versions of traditional paper business cards. They contain your contact information, such as your name, job, company name, email address, website, phone number, and social media profiles, and can be shared electronically.They eliminate the need for paper and printing, which can help reduce your environmental impact.They are typically cheaper than traditional paper business cards, especially when you factor in the cost of printing and design.You can share them instantly via email, text message, social media, or by using a QR code.",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  icon: const Text("View Sample Cards",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  label: const Icon(
                    Icons.forward,
                    size: 30,
                    color: Colors.red,
                  ),
                  onPressed: () => {
                    Fluttertoast.showToast(
                        msg: "you moved to bussiness card page"),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusinessPage(),
                        ))
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
