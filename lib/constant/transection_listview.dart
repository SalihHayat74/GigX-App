import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_text.dart';

import '../home/deposit_aud.dart';
import 'colors.dart';

class Browse {
  String title;
  String percent;
  String date;
  String status;
  Color colors;

  Browse({
    required this.title,
    required this.percent,
    required this.date,
    required this.status,
    required this.colors,
  });
}

class HistorySubject extends StatefulWidget {
  const HistorySubject({
    Key? key,
  }) : super(key: key);

  @override
  State<HistorySubject> createState() => _HistorySubjectState();
}

class _HistorySubjectState extends State<HistorySubject> {
  final List<Browse> historyLst = [
    Browse(
        title: 'GigXcoin',
        percent: '- 0.09%',
        date: 'April 11, 2023',
        status: 'Withdrawn',
        colors: Colors.red),
    Browse(
        title: 'GigXcoin',
        percent: '+ 10.9%',
        date: 'April 11, 2023',
        status: 'Deposited',
        colors: Colors.green),
    Browse(
        title: 'GigXcoin',
        percent: '+ 10.9%',
        date: 'April 11, 2023',
        status: 'Deposited',
        colors: Colors.green),
  ];
  int _current_index = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: historyLst.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _current_index = index;
                  if (_current_index == 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DepositAUD()));
                  }
                });
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: buttonColors1,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image(
                        image: AssetImage('images/appBar_assets/mainLogo.png'),
                        color: whiteColor,
                      ),
                    ),
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableText(
                        title: historyLst[index].percent,
                        color: subtitleColor,
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      ReusableText(
                        title: historyLst[index].date,
                        color: subtitleColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableText(
                        title: historyLst[index].status,
                        color: historyLst[index].colors,
                        weight: FontWeight.w300,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
