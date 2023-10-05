import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/screen/license/license_scanning.dart';
import 'package:image_picker/image_picker.dart';

class DriverLicense extends StatefulWidget {
  const DriverLicense({Key? key}) : super(key: key);

  @override
  State<DriverLicense> createState() => _DriverLicenseState();
}

class _DriverLicenseState extends State<DriverLicense> {
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  /// Get from gallery
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            const Center(child: Image(image: AssetImage('images/scanPassport.png'))),
            Container(
              padding: const EdgeInsets.only(left: 25, top: 25),
              height: 270,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff03E5D4),
                        blurRadius: 10,
                        spreadRadius: 1),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ReusableText(
                    title: 'Scan or upload your Driver\nLicense',
                    color: Colors.white,
                    weight: FontWeight.w500,
                    size: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ReusableText(
                    title: 'Please have your following ID ready',
                    color: Color(0xffB4B4B4),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // pickImage();
                        // getFromGallery();
                        // getImage();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartScanningLicense()));
                      },
                      child: const ReusableButton(
                        title: 'Start scanning',
                        value: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Center(
                  //   child: Container(
                  //     padding:
                  //         const EdgeInsets.symmetric(horizontal: 135, vertical: 15),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(30),
                  //       border: Border.all(
                  //           color: const Color(0xff03E5D4), width: 2),
                  //     ),
                  //     child: const ReusableText(
                  //       title: 'Upload',
                  //       color: Color(0xff03E5D4),
                  //       weight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ));
  }
}
