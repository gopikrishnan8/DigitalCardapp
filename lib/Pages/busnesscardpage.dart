import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/CardPages.dart/CardPage.dart';
import 'package:frontend/CardPages.dart/EricPage.dart';
import 'package:frontend/CardPages.dart/Krist.dart';
import 'package:frontend/CardPages.dart/Mathew.dart';
import 'package:frontend/CardPages.dart/Monish.dart';
import 'package:frontend/CardPages.dart/Youvashree.dart';
import 'package:frontend/CardPages.dart/darleed.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
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
      body: Center(
        child: Container(
          width: 500,
          margin: EdgeInsets.all(50),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ExpansionTile(
                  title: const Text(
                    "Gopi Krishnan",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/myimage.jpeg"),
                    radius: 50,
                  ),
                  subtitle: const Text("Software Developer"),
                  children: <Widget>[
                    TextButton.icon(
                        icon: const Text("",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        label: const Icon(
                          Icons.forward,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () => {
                              Fluttertoast.showToast(
                                  msg: "you moved to DvidRajPage"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CardPage(),
                                  ))
                            })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ExpansionTile(
                  title: const Text(
                    "Monish",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/monish.jpg"),
                    radius: 50,
                  ),
                  subtitle: const Text("Customer Support Associative"),
                  children: <Widget>[
                    TextButton.icon(
                        icon: const Text("",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        label: const Icon(
                          Icons.forward,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () => {
                              Fluttertoast.showToast(
                                  msg: "You moved to MonishPage"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MonishPage(),
                                  ))
                            }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ExpansionTile(
                  title: const Text(
                    "Mathew",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images.jpg"),
                    radius: 50,
                  ),
                  subtitle: const Text("Java Developer"),
                  children: <Widget>[
                    TextButton.icon(
                        icon: const Text("",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        label: const Icon(
                          Icons.forward,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () => {
                              Fluttertoast.showToast(
                                  msg: "you moved to MathewPage"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MathewPage(),
                                  ))
                            }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ExpansionTile(
                  title: const Text(
                    "Youvashree",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/youvashree.webp"),
                    radius: 50,
                  ),
                  subtitle: const Text("HR IT Lead"),
                  children: <Widget>[
                    TextButton.icon(
                        icon: const Text("",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        label: const Icon(
                          Icons.forward,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () => {
                              Fluttertoast.showToast(
                                  msg: "you moved to YouvashreePage"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Youvashreepage(),
                                  ))
                            }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ExpansionTile(
                  title: const Text(
                    "Darlene D.Brenton",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/darlee.jpg"),
                    radius: 50,
                  ),
                  subtitle: const Text("Director of Customer OnBoarding"),
                  children: <Widget>[
                    TextButton.icon(
                        icon: const Text("",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        label: const Icon(
                          Icons.forward,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () => {
                              Fluttertoast.showToast(
                                  msg: "you moved to DarlenePage"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Darleed(),
                                  ))
                            }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ExpansionTile(
                  title: const Text(
                    "Eric Tallen",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/dralee.webp"),
                    radius: 50,
                  ),
                  subtitle: const Text("Content Creator"),
                  children: <Widget>[
                    TextButton.icon(
                        icon: const Text("",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        label: const Icon(
                          Icons.forward,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () => {
                              Fluttertoast.showToast(
                                  msg: "you moved to EricPage"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EricPage(),
                                  ))
                            }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ExpansionTile(
                  title: const Text(
                    "Kirsty Turnbull",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/kristy.jpg"),
                    radius: 50,
                  ),
                  subtitle: const Text("Creative Director"),
                  children: <Widget>[
                    TextButton.icon(
                        icon: const Text("",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        label: const Icon(
                          Icons.forward,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () => {
                              Fluttertoast.showToast(
                                  msg: "you moved to KristyPage"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const KristPage(),
                                  ))
                            }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        centerTitle: true,
        // title: const Text('Bussiness Card App'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                title: const Text(
                  "GopiKrishnan",
                  style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/myimage.jpeg"),
                  radius: 50,
                ),
                subtitle: const Text("Software Developer"),
                children: <Widget>[
                  TextButton.icon(
                      icon: const Text("",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      label: const Icon(
                        Icons.forward,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () => {
                            Fluttertoast.showToast(
                                msg: "you moved to DvidRajPage"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CardPage(),
                                ))
                          })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                title: const Text(
                  "Monish",
                  style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/monish.jpg"),
                  radius: 50,
                ),
                subtitle: const Text("Customer Support Associative"),
                children: <Widget>[
                  TextButton.icon(
                      icon: const Text("",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      label: const Icon(
                        Icons.forward,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () => {
                            Fluttertoast.showToast(
                                msg: "You moved to MonishPage"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MonishPage(),
                                ))
                          }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                title: const Text(
                  "Mathew",
                  style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images.jpg"),
                  radius: 50,
                ),
                subtitle: const Text("Java Developer"),
                children: <Widget>[
                  TextButton.icon(
                      icon: const Text("",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      label: const Icon(
                        Icons.forward,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () => {
                            Fluttertoast.showToast(
                                msg: "you moved to MathewPage"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MathewPage(),
                                ))
                          }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                title: const Text(
                  "Youvashree",
                  style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/youvashree.webp"),
                  radius: 50,
                ),
                subtitle: const Text("HR IT Lead"),
                children: <Widget>[
                  TextButton.icon(
                      icon: const Text("",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      label: const Icon(
                        Icons.forward,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () => {
                            Fluttertoast.showToast(
                                msg: "you moved to YouvashreePage"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Youvashreepage(),
                                ))
                          }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                title: const Text(
                  "Darlene D.Brenton",
                  style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/darlee.jpg"),
                  radius: 50,
                ),
                subtitle: const Text("Director of Customer OnBoarding"),
                children: <Widget>[
                  TextButton.icon(
                      icon: const Text("",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      label: const Icon(
                        Icons.forward,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () => {
                            Fluttertoast.showToast(
                                msg: "you moved to DarlenePage"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Darleed(),
                                ))
                          }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                title: const Text(
                  "Eric Tallen",
                  style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/dralee.webp"),
                  radius: 50,
                ),
                subtitle: const Text("Content Creator"),
                children: <Widget>[
                  TextButton.icon(
                      icon: const Text("",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      label: const Icon(
                        Icons.forward,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () => {
                            Fluttertoast.showToast(
                                msg: "you moved to EricPage"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EricPage(),
                                ))
                          }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                title: const Text(
                  "Kirsty Turnbull",
                  style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/kristy.jpg"),
                  radius: 50,
                ),
                subtitle: const Text("Creative Director"),
                children: <Widget>[
                  TextButton.icon(
                      icon: const Text("",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      label: const Icon(
                        Icons.forward,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () => {
                            Fluttertoast.showToast(
                                msg: "you moved to KristyPage"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const KristPage(),
                                ))
                          }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
