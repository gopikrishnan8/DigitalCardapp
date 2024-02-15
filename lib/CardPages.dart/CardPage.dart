import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/CardPages.dart/location.dart';
import 'package:iconsax/iconsax.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcard_maintained/vcard_maintained.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

Future<void> requestStoragePermission() async {
  var status = await Permission.storage.request();
  if (status != PermissionStatus.granted) {
    // Handle permission denial or request again
    throw Exception('Storage permission is required to download vCards.');
  }
}

void openFilePicker(String filePath) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.any,
    initialDirectory: filePath,
  );
  if (result != null) {
    print('Picked file: ${result.files.single.path}');
  }
}

class _CardPageState extends State<CardPage> {
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

  void _showSaveLocation(BuildContext context, String filePath) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('vCard saved at: $filePath'),
        duration: Duration(seconds: 5),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    String msg1 =
        "Hi, Please click below link to check our website for Digital card website VCard:https://helpful-genie-623249.netlify.app. Regards, Gopi Krishnan C";

    final TextEditingController _phoneNumberController =
        TextEditingController();
    void sendWhatsapp() async {
      String phoneNumber = '7395911863';
      var url =
          "https://wa.me/7395911863?text= Hi, GopiKishnan C Got reference from your Digital VCard.Want to know more about your products and services. Thank You!";
      await launchUrl(Uri.parse(url));
    }

    void _sendWhatsAppMessage() async {
      String phoneNumber = _phoneNumberController.text.trim();
      String message =
          "Hi, GopiKishnan C Got reference from your Digital VCard.Want to know more about your products and services. Thank You!"; // Predefined message

      // Check if the phone number is not empty
      if (phoneNumber.isNotEmpty) {
        // Encode the message and phone number
        String url =
            "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}";
        await launchUrl(Uri.parse(url));
      } else {
        // Show an alert if phone number is empty
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Please enter a phone number.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    shareText() {
      Share.share(msg1);
    }

    shareImage() async {
      // XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // if (image == null) return;
      Share.share(msg1);
    }

    void DownloadVCF() {
      // Create a vCard
      final vCard = VCard();
      vCard.firstName = 'Gopi';
      vCard.lastName = 'Krishnan';
      vCard.email = 'gopikrishnagopi2000@gmail.com';
      vCard.cellPhone = '7395911863';

      // Convert vCard to string
      final vCardString = vCard.getFormattedString();

      // Convert to Blob
      final blob = html.Blob([Uint8List.fromList(utf8.encode(vCardString))]);

      // Create download link
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "contact.vcf")
        ..click();

      // Clean up
      html.Url.revokeObjectUrl(url);
    }

    return SingleChildScrollView(
        child: Center(
      child: Container(
        width: 800,
        //height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: CustomPaint(
          painter: CurvePainter(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.20,
                    backgroundImage: AssetImage("assets/myimage.jpeg"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Gopi Krishnan",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.15,
                      color: Colors.black)),
              const SizedBox(
                height: 5,
              ),
              const Text("Software Developer", style: TextStyle(fontSize: 15)),
              const SizedBox(
                height: 5,
              ),
              const Text("Chennai", style: TextStyle(fontSize: 13)),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        final Uri url = Uri(scheme: 'tel', path: "7395911863");
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("cannot launch this url");
                        }
                      },
                      icon: Icon(
                        Icons.phone,
                        size: 25,
                        color: Colors.red,
                      )),
                  const SizedBox(width: 15),
                  IconButton(
                      onPressed: () {
                        sendWhatsapp();
                      },
                      icon: Image.asset(
                        'assets/whatsapp.png',
                        width: 25,
                        height: 25,
                      )),
                  const SizedBox(width: 15),
                  IconButton(
                      onPressed: () async {
                        String? encodeQueryParameters(
                            Map<String, String> params) {
                          return params.entries
                              .map((MapEntry<String, String> e) =>
                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&');
                        }

                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'gopikrishnagopi2000@gmail.com',
                          // query: encodeQueryParameters(<String, String>{
                          //   '',
                          //   }),
                        );
                        launchUrl(emailUri);
                      },
                      icon: Icon(
                        Icons.mail_rounded,
                        size: 25,
                        color: Colors.redAccent,
                      )),
                  const SizedBox(width: 15),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const location(),
                            ));
                      },
                      icon: Icon(Iconsax.location)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.phone, color: Colors.green),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "7395911863",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.mail, color: Colors.purple),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "gopikrishnagopi2000@gmail.com",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Enter WhatsApp Number',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _sendWhatsAppMessage();
                      },
                      icon: Image.asset(
                        'assets/whatsapp.png',
                        width: 25,
                        height: 25,
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      DownloadVCF();
                    },
                    child: Text('Save'),
                  ),
                  SizedBox(width: 15),
                  IconButton(
                      onPressed: () {
                        shareImage();
                      },
                      icon: Icon(Iconsax.share)),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.web_asset_rounded),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "www.gopikrishna.com",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  height: 200,
                  // width: 400,
                  child: Image(image: AssetImage("assets/qr-code.png"))),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildMobileLayout(BuildContext context) {
    String msg1 =
        "Hi, Please click below link to check our website for Digital card website VCard:https://helpful-genie-623249.netlify.app. Regards, Gopi Krishnan C";
    final _fullName = 'Gopi Krishnan';
    final _phoneNumber = '+7395911863';
    final _email = 'gopikrishnagopi2000@gmail.com';

    final TextEditingController _phoneNumberController =
        TextEditingController();
    void _sendWhatsAppMessage() async {
      String phoneNumber = _phoneNumberController.text.trim();
      String message =
          "Hi, GopiKishnan C Got reference from your Digital VCard.Want to know more about your products and services. Thank You!"; // Predefined message

      // Check if the phone number is not empty
      if (phoneNumber.isNotEmpty) {
        // Encode the message and phone number
        String url =
            "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}";
        await launchUrl(Uri.parse(url));
      } else {
        // Show an alert if phone number is empty
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Please enter a phone number.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    void sendWhatsapp() async {
      String phoneNumber = '7395911863';
      var url =
          "https://wa.me/7395911863?text= Hi, GopiKishnan C Got reference from your Digital VCard.Want to know more about your products and services. Thank You!";
      await launchUrl(Uri.parse(url));
    }

    shareText() {
      Share.share(msg1);
    }

    shareImage() async {
      // XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // if (image == null) return;
      Share.share(msg1);
    }

    // void generateAndSaveVCF() async {
    //   // Create a vCard
    //   final vCard = VCard();
    //   vCard.firstName = 'Gopi';
    //   vCard.lastName = 'Krishnan';
    //   vCard.email = 'gopikrishnan2000@example.com';
    //   vCard.cellPhone = '7395911863';

    //   // Convert vCard to string
    //   final vCardString = vCard.getFormattedString();

    //   // Get the directory for saving files
    //   final directory = await getApplicationDocumentsDirectory();
    //   final file = File('${directory.path}/contact.vcf');

    //   // Write the VCF content to the file
    //   try {
    //     await file.writeAsString(vCardString);
    //     print('File saved successfully');
    //   } catch (e) {
    //     print('Error saving file: $e');
    //   }

    //   // Show a message or handle the saved file according to your app's flow
    // }
    VCard createVCard() {
      // final emailList = _email.isNotEmpty ? [email(address: _email)] : [];
      return VCard()
        ..formattedName = _fullName
        ..cellPhone = _phoneNumber
        ..email = _email; // Assign the list directly
    }

    void downloadVCard() async {
      await requestStoragePermission();

      final vCar = createVCard();
      final tempDir = await getTemporaryDirectory();
      final filePath = File('${tempDir.path}/${vCar.formattedName}.vcf');

      try {
        await filePath.writeAsString(vCar.getFormattedString());
        await Share.shareXFiles([XFile('${filePath.path}')]);
      } catch (e) {
        Fluttertoast.showToast(msg: "Your error message is $e");
      }
    }

    return SingleChildScrollView(
        child: Container(
      width: 400,
      color: Colors.white,
      child: CustomPaint(
        painter: CurvePainter(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.20,
                  backgroundImage: AssetImage("assets/myimage.jpeg"),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Gopi Krishnan",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.15,
                    color: Colors.black)),
            const SizedBox(
              height: 5,
            ),
            const Text("Software Developer", style: TextStyle(fontSize: 15)),
            const SizedBox(
              height: 5,
            ),
            const Text("Chennai", style: TextStyle(fontSize: 13)),
            SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      final Uri url = Uri(scheme: 'tel', path: "7395911863");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        print("cannot launch this url");
                      }
                    },
                    icon: Icon(
                      Icons.phone,
                      size: 25,
                      color: Colors.red,
                    )),
                SizedBox(width: 15),
                IconButton(
                    onPressed: () {
                      sendWhatsapp();
                    },
                    icon: Image.asset(
                      'assets/whatsapp.png',
                      width: 25,
                      height: 25,
                    )),
                SizedBox(width: 15),
                IconButton(
                    onPressed: () async {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: 'gopikrishnagopi2000@gmail.com',
                        // query: encodeQueryParameters(<String, String>{
                        //   '',
                        //   }),
                      );
                      launchUrl(emailUri);
                    },
                    icon: const Icon(
                      Icons.mail,
                      size: 25,
                      color: Colors.red,
                    )),
                const SizedBox(width: 15),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const location(),
                          ));
                    },
                    icon: Icon(Iconsax.location)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(2, 1, 1, 3),
                    width: MediaQuery.of(context).size.width * 0.08,
                    height: MediaQuery.of(context).size.width * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade400,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(CupertinoIcons.phone, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "7395911863",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.mail, color: Colors.purple),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "gopikrishnagopi2000@gmail.com",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Enter WhatsApp Number',
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _sendWhatsAppMessage();
                    },
                    icon: Image.asset(
                      'assets/whatsapp.png',
                      width: 25,
                      height: 25,
                    )),
                const SizedBox(height: 15),
                IconButton(
                    onPressed: () {
                      downloadVCard();
                    },
                    icon: Icon(Iconsax.save_2)),
              ],
            ),
            SizedBox(height: 20),
            IconButton(
                onPressed: () {
                  shareImage();
                },
                icon: Icon(Iconsax.share)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.web_asset_rounded),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "www.gopikrishna.com",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                height: 200,
                // width: 400,
                child: Image(image: AssetImage("assets/qr-code.png"))),
          ],
        ),
      ),
    ));
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();
    paint.style = PaintingStyle.fill;
    paint.shader = LinearGradient(
      colors: [
        Color(0xff8160c7),
        Color(0xff8f77dc),
        Color(0xff8f67bc),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(
      Rect.fromLTRB(
          size.width * 0.15, size.height * 0.15, size.width, size.height * 0.1),
    );
    path.moveTo(0, size.height * 0.15);
    path.quadraticBezierTo(
        size.width * 0.48, size.height * 0.38, size.width, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.48, size.height * 0.38, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
