import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_text.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final double? value;

  const ReusableButton({Key? key, required this.title, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 105, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xff03E5D4),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: value!),
        child: ReusableText(
          title: title,
          color: Colors.white,
          weight: FontWeight.bold,
          size: 16,
        ),
      ),
    );
  }
}
