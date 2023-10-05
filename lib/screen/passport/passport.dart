import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/screen/passport/passportscanning.dart';

class ScanPassport extends StatefulWidget {
  const ScanPassport({Key? key}) : super(key: key);

  @override
  State<ScanPassport> createState() => _ScanPassportState();
}

class _ScanPassportState extends State<ScanPassport> {
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
              padding: EdgeInsets.only(left: 25, top: 25),
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
                    title: 'Scan or upload your\nPassport',
                    color: Colors.white,
                    weight: FontWeight.w500,
                    size: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ReusableText(
                    title: 'Hold your phone at your eye level',
                    color: Color(0xffB4B4B4),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartScanningPassport()));
                    },
                    child: const Center(
                      child: ReusableButton(
                        title: 'Scan Passport',
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
                  //         EdgeInsets.symmetric(horizontal: 135, vertical: 15),
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
