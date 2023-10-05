import 'package:flutter/material.dart';
import 'package:gigx_website/constant/colors.dart';
import 'package:gigx_website/constant/reusable_text.dart';

import '../constant/notification_listview.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
        actions: const [
          Image(image: AssetImage('images/Search.png')),
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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const ReusableText(
                  title: 'Today',
                  color: subtitleColor,
                  size: 18,
                ),
              ),
              NotificationSubject(),

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
