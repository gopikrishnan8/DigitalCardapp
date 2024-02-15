import 'package:flutter/material.dart';

class MathewPage extends StatefulWidget {
  const MathewPage({super.key});

  @override
  State<MathewPage> createState() => _MathewPageState();
}

class _MathewPageState extends State<MathewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(color: Colors.blue, blurRadius: 20.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images.jpg"),
                radius: 100,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Mathew",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text("Java Developer", style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.green,
                child: ListTile(
                  textColor: Colors.black,
                  title: Text("9254666495"),
                  leading: Icon(Icons.phone),
                  iconColor: Colors.red,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.yellow,
                child: ListTile(
                  textColor: Colors.black,
                  title: Text("mathew2654@gmail.com"),
                  leading: Icon(Icons.email),
                  iconColor: Colors.red,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.lightBlueAccent,
                child: ListTile(
                  textColor: Colors.black,
                  title: Text("https://fluttercoding.com"),
                  leading: Icon(Icons.web_asset),
                  iconColor: Colors.red,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  // width: 400,
                  child: Image(image: AssetImage("assets/qr2.png"))),
            ],
          ),
        ),
      ),
    );
  }
}
