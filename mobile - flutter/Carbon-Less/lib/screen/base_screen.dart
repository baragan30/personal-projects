import 'dart:io';

import 'package:echofootprint2/model/DUMMY_DATA.dart';
import 'package:echofootprint2/model/company.dart';
import 'package:echofootprint2/screen/company_screen.dart';
import 'package:echofootprint2/screen/main_screen.dart';
import 'package:echofootprint2/screen/progress_screen.dart';
import 'package:echofootprint2/screen/reward_screen.dart';
import 'package:echofootprint2/screen/vouchers_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

///Contain Navigation Bar , Background Image and Floating Button
class BaseScreen extends StatelessWidget {
  BaseScreen({@required this.child});

  Widget child;
  final String modelname = 'borsecVSredbull';

  ///Get an Image from camera
  Future<File> _takeImage() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    return File(pickedFile.path);
  }

  ///Recognize if in the image is a redbull or an Borsec
  Future<List> getRecognition(File image) async {
    Tflite.close();
    await Tflite.loadModel(
        model: "assets/$modelname.tflite", labels: "assets/$modelname.txt");
    List recognition = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    Tflite.close();
    return recognition;
  }

  ///Get a company based by a recognition
  Company getCompany(List recognition) {
    print(recognition.first);
    if (recognition.first['index'] == 1 &&
        (recognition.first['confidence'] as double > 0.6)) {
      return companies[1];
    }
    return companies[0];
  }

  ///do classify an image , recognize a company and go to Reward Screen
  Future getCarbonFootPrint(BuildContext context) async {
    File image = await _takeImage();
    List recognition = await getRecognition(image);
    Company company = getCompany(recognition);
    Navigator.of(context).pushNamed(RewardScreen.routeName, arguments: company);
  }

  @override
  Widget build(BuildContext context) {
    final double _floatingSize = 80;
    final double _floatingIconSize = 45;
    return Scaffold(
      /// AppBar
      appBar:
          AppBar(backgroundColor: Colors.green, title: const Text('CO2-LESS')),

      ///Background Image
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
            alignment: Alignment.topRight,
          ),
        ),
        child: child /* add child content here */,
      ),

      ///Floating Button
      floatingActionButton: Container(
        height: _floatingSize,
        width: _floatingSize,
        child: FloatingActionButton(
          onPressed: () {
            getCarbonFootPrint(context);
          },
          child: Icon(
            Icons.add,
            size: _floatingIconSize,
          ),
        ),
      ),

      ///Menu
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(child: Text('Menu')),
            ),
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(MainScreen.routeName);
              },
            ),
            ListTile(
              title: const Text('Progress'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProgressScreen.routeName);
              },
            ),
            ListTile(
              title: const Text('Vouchers'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(VouchersScreen.routeName);
              },
            ),
            ListTile(
              title: const Text('Company'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(CompanyScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
