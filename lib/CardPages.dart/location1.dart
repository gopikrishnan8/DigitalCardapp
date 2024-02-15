import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vcard_maintained/vcard_maintained.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = '';
  String phoneNumber = '';
  Future<void> createAndSaveVcf(String name, String phoneNumber) async {
    // Request storage permission if necessary
    if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }

    // Check if permission is granted
    if (await Permission.storage.status.isGranted) {
      // Get application document directory
      final appDocDir = await getApplicationDocumentsDirectory();
      final filePath = File('${appDocDir.path}/$name.vcf');

      // Create VCard object
      final vcard = VCard();
      vcard.firstName = name;
      vcard.cellPhone = phoneNumber;

      // Write VCard content to file
      await filePath.writeAsString(vcard.toString(), mode: FileMode.write);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Contact VCF file saved to: $filePath'),
        ),
      );
    } else {
      // Handle permission denial
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Storage permission is required to save the VCF file.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create and Download VCF File'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                onChanged: (value) => phoneNumber = value,
              ),
              ElevatedButton(
                onPressed: () => createAndSaveVcf(name, phoneNumber),
                child: Text('Create and Save VCF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
