import 'package:flutter/material.dart';
import 'package:gigx_website/constant/colors.dart';
import 'package:gigx_website/constant/reusable_text.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image(
              image: AssetImage('images/appBar_assets/mainLogo.png'),
            ),
          ),
          title: Text('My Cards'),
          actions: [
            Image(image: AssetImage('images/appBar_assets/Plus.png')),
            SizedBox(
              width: 10,
            )
          ],
          centerTitle: true,
        ),
        body: Stack(
          children: [
            const Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Image(
                            image: AssetImage(
                                'images/mycard_assets/mastercard.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Image(
                            image: AssetImage(
                                'images/mycard_assets/mastercard.png')),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ReusableText(
                    title: '2 Cards',
                    color: whiteColor,
                    weight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff1E1E1E),
                              Color(0xff1E1E1E),
                              Color(0xff1E1E1E),
                              Color(0x2003E5D4)
                            ]),
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff1E1E1E)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              const SizedBox(
                                child: Image(
                                    image: AssetImage(
                                        'images/mycard_assets/mastercard-seeklogo.com 2.png')),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  ReusableText(
                                    title: '**** **** **** 4826 \nMastercard',
                                    color: subtitleColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: '\$487.12',
                                    color: whiteColor,
                                    size: 18,
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.more_vert,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff1E1E1E),
                              Color(0xff1E1E1E),
                              Color(0xff1E1E1E),
                              Color(0x2003E5D4)
                            ]),
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff1E1E1E)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                child: Image(
                                    image: AssetImage(
                                        'images/mycard_assets/vesa.png')),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: '**** **** **** 4826 Visacard',
                                    color: subtitleColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: '\$487.12',
                                    color: whiteColor,
                                    size: 18,
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.more_vert,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
