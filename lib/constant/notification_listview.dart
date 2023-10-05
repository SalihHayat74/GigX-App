import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_text.dart';

import 'colors.dart';

class Browse {
  String title;
  String datetime;
  String image;

  Browse({
    required this.title,
    required this.datetime,
    required this.image,
  });
}

class NotificationSubject extends StatefulWidget {
  const NotificationSubject({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationSubject> createState() => _NotificationSubjectState();
}

class _NotificationSubjectState extends State<NotificationSubject> {
  final List<Browse> historyLst = [
    Browse(
      title: 'You have successfully deposited funds!',
      datetime: 'April 12, 2023 at 01:00 pm',
      image: 'images/Ellipse.png',
    ),
    Browse(
      title: 'You have successfully deposited funds!',
      datetime: 'April 12, 2023 at 01:00 pm',
      image: 'images/Ellipse.png',
    ),
    Browse(
      title: 'You have successfully deposited funds!',
      datetime: 'April 12, 2023 at 01:00 pm',
      image: 'images/Ellipse.png',
    ),
    Browse(
      title: 'You have successfully deposited funds!',
      datetime: 'April 12, 2023 at 01:00 pm',
      image: 'images/Ellipse.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: historyLst.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(historyLst[index].image),
                  height: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      title: historyLst[index].title,
                      color: Colors.white,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReusableText(
                      title: historyLst[index].datetime,
                      color: subtitleColor,
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
