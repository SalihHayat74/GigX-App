import 'package:flutter/material.dart';
import 'package:gigx_website/constant/colors.dart';
import 'package:gigx_website/constant/reusable_text.dart';

import '../constant/transection_listview.dart';
import 'notifications.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Image(
            image: AssetImage('images/appBar_assets/mainLogo.png'),
          ),
        ),
        title: const Text('Transactions'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Notifications()));
              },
              child: const Image(
                  image: AssetImage('images/appBar_assets/Notification.png'))),
          const SizedBox(
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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ReusableText(
                      title: '3 Transcations',
                      color: subtitleColor,
                    ),
                    Row(
                      children: [
                        const ReusableText(
                          title: 'Filter',
                          color: whiteColor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Image(
                              image:
                                  AssetImage('images/transaction/filter.png')),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 0.5,
                color: subtitleColor,
              ),
              const HistorySubject(),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       CircleAvatar(
              //         radius: 30,
              //         backgroundColor: buttonColors1,
              //         child: Image(
              //           image: AssetImage('images/appBar_assets/mainLogo.png'),
              //           color: whiteColor,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           ReusableText(
              //             title: 'GigXcoin',
              //             color: Colors.white,
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //           ReusableText(
              //             title: '- 0.09%',
              //             color: subtitleColor,
              //           )
              //         ],
              //       ),
              //       Spacer(),
              //       Column(
              //         children: [
              //           ReusableText(
              //             title: 'April 11, 2023',
              //             color: subtitleColor,
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //           ReusableText(
              //             title: 'Withdrawn',
              //             color: Colors.red,
              //             weight: FontWeight.w300,
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
