import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/screen/login.dart';
import 'package:gigx_website/screen/create_account.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Image(image: AssetImage('images/splashLogo.png')),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Welcome to the\nGig',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30),
                            children: [
                              TextSpan(
                                  text: 'X',
                                  style: TextStyle(
                                      color: Color(0xff03E5D4), fontSize: 30)),
                              TextSpan(
                                  text: 'Coin',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ReusableText(
                          textAlign: TextAlign.center,
                          title:
                              ('The easiest and most secure way to\nmanage your GigXcoin cryptocurrency'),
                          color: Color(0xffB4B4B4),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateAccount()));
                            },
                            child: ReusableButton(
                              title: 'Get Started',
                              value: 0,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color(0xff03E5D4), width: 2)),
                          child: InkWell(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogIn()));
                            },
                            child:ReusableText(
                              title: 'I already have an account',
                              weight: FontWeight.bold,
                              color: Color(0xff03E5D4),
                            ),
                          )
                        ),
                      ],
                    )
                  ]),
            )
          ],
        ));
  }
}
