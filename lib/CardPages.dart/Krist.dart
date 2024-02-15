import 'package:flutter/material.dart';

class KristPage extends StatefulWidget {
  const KristPage({super.key});

  @override
  State<KristPage> createState() => _KristPageState();
}

class _KristPageState extends State<KristPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 45.0,
                backgroundImage: AssetImage('assets/logos.png'),
              ),
              SizedBox(
                height: 20.0,
                child: Divider(color: Colors.deepPurple[100]),
              ),
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('assets/kristy.jpg'),
              ),
              Text(
                'Kristy Turnbull',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Creative Director',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 18.0,
                  color: Colors.deepPurple[50],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 140.0,
                child: Divider(color: Colors.deepPurple[100]),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.deepPurple.shade900,
                  ),
                  title: Text(
                    '(+972) 054-464-9940',
                    style: TextStyle(
                      color: Colors.deepPurple.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.deepPurple.shade900,
                  ),
                  title: Text(
                    'kristy@icloud.com',
                    style: TextStyle(
                      color: Colors.deepPurple.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.code,
                    color: Colors.deepPurple.shade900,
                  ),
                  title: Text(
                    'kristygithub.com/dimaodin',
                    style: TextStyle(
                      color: Colors.deepPurple.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
                child: Divider(color: Colors.deepPurple[100]),
              ),
              Container(
                  height: 200,
                  // width: 400,
                  child: Image(image: AssetImage("assets/qr6.png"))),
            ],
          ),
        ),
      ),
    );
  }
}
