import 'package:flutter/material.dart';

class EricPage extends StatefulWidget {
  const EricPage({super.key});

  @override
  State<EricPage> createState() => _EricPageState();
}

class _EricPageState extends State<EricPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage(
                  'assets/dralee.webp',
                ),
              ),
              Text(
                'Eric Tallen',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SourceSansPro',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Content Creator',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20.0,
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 50.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white70,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.pink,
                  ),
                  title: Text(
                    "erictallen@eoan.ie",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.pink,
                  ),
                  title: Text(
                    "+353 86 333 8888",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.link,
                    color: Colors.pink,
                  ),
                  title: Text(
                    "https://erictalleneoan.ie",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.location_city,
                    color: Colors.pink,
                  ),
                  title: Text(
                    "New York, United States",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  // width: 400,
                  child: Image(image: AssetImage("assets/qr5.png"))),
            ],
          ),
        ),
      ),
    );
  }
}
