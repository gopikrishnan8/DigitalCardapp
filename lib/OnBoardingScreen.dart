import 'package:flutter/material.dart';
import 'package:frontend/LandingPage/LandingPage.dart';
import 'package:frontend/Navbar/Navbar.dart';
import 'package:frontend/Screens/Login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int indexVar = 0;
  PageController pageController = PageController();
  List onBoardingData = [
    {
      "title": "About Our Application",
      "subtitle":
          "WordFlow is a text-to-speech(TTS) and speech-to-text(STT) application that converts written text into natural-sounding audio and vise versa.",
      "image": "assets/boarding1.png"
    },
    {
      "title": "Get Experienced",
      "subtitle":
          "WordFlow isn't just an app, it's an experience multiplier.It transforms the way we interact the information, opening doors to a world of knowledge and convenience.",
      "image": "assets/boarding2.png"
    },
    {
      "title": "Application & Media",
      "subtitle":
          "WordFlow isn't just like a standalone app it's a gateway to a seamless ecosystem of applications and media. Turn any written text into natural-sounding audio.",
      "image": "assets/boarding3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(195, 20, 50, 1.0),
              Color.fromRGBO(36, 11, 54, 1.0)
            ]),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Navbar(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: LandingPage(),
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(24, 24, 32, 1),
      body: PageView.builder(
          itemCount: onBoardingData.length,
          controller: pageController,
          onPageChanged: (val) {
            indexVar = val;
            setState(() {});
          },
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: Image.asset(onBoardingData[index]['image']).image,
                      fit: BoxFit.contain)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 450,
                    ),
                    Center(
                      child: Text(
                        onBoardingData[index]['title'],
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        onBoardingData[index]['subtitle'],
                        //textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: SizedBox(
                        height: 10,
                        child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return AnimatedContainer(
                                height: 10,
                                width: indexVar == i ? 40 : 20,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                duration: const Duration(seconds: 1),
                                decoration: BoxDecoration(
                                  color: indexVar == i
                                      ? Colors.black
                                      : Colors.black38,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              );
                            }),
                      ),
                    ),
                    const SizedBox(height: 20),
                    indexVar == 2
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: const Center(
                                child: Text("Get Started",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              indexVar = index + 1;
                              pageController.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.linear);
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: const Center(
                                child: Text("Next",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
