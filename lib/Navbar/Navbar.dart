import 'package:flutter/material.dart';
import 'package:frontend/Screens/Login_screen.dart';
import 'package:frontend/Screens/registration_screen.dart';

class Navbar extends StatelessWidget {
  @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth > 1200) {
//           return DesktopNavbar();
//         } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
//           return DesktopNavbar();
//         } else {
//           return MobileNavbar();
//         }
//       },
//     );
//   }
// }

// class DesktopNavbar extends StatelessWidget {
//   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "WordFlow",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            Row(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()));
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "LogIn",
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                // Text(
                //   "Portfolio",
                //   style: TextStyle(color: Colors.white),
                // ),
                // SizedBox(
                //   width: 30,
                // ),
                // MaterialButton(
                //   color: Colors.pink,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => Home()));
                //   },
                //   child: const Text(
                //     "Get Started",
                //     style: TextStyle(color: Colors.white, fontSize: 18),
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class MobileNavbar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//       child: Container(
//         child: Column(children: <Widget>[
//           Text(
//             "RetroPortal Studio",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "Home",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 SizedBox(
//                   width: 30,
//                 ),
//                 Text(
//                   "About Us",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 SizedBox(
//                   width: 30,
//                 ),
//                 Text(
//                   "Portfolio",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }

