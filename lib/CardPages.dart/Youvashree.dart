import 'package:flutter/material.dart';

class Youvashreepage extends StatefulWidget {
  const Youvashreepage({super.key});

  @override
  State<Youvashreepage> createState() => _YouvashreepageState();
}

class _YouvashreepageState extends State<Youvashreepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/youvashree.webp"),
                    radius: 100,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Youvashree",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text("Hr IT Intern",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2.0)),
                  const SizedBox(
                    height: 20,
                    width: 200,
                    child: Divider(
                      color: Colors.amber,
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("+9156836578"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.email),
                      title: Text("youvashreebm2000@gmail.com"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.web_asset),
                      title: Text("https://ypuvashreeyouva123.com"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 200,
                      // width: 400,
                      child: Image(image: AssetImage("assets/qr-code3.png"))),
                ]),
          )),
        ));
  }
}
