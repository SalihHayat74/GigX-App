import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_text.dart';

class ListTileConstant extends StatelessWidget {
  final String title;
  final Widget pageName;
  final Widget? widget;
  const ListTileConstant(
      {Key? key, required this.title, required this.pageName, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pageName));
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 5,
                  spreadRadius: 3,
                  offset: const Offset(0, 5))
            ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  title: title,
                  weight: FontWeight.bold,
                  size: 17,
                ),
                widget!
              ],
            )),
      ),
    );
  }
}
