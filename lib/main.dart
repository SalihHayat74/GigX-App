import 'package:flutter/material.dart';
import 'package:gigx_website/provider/access_token_provider.dart';
import 'package:gigx_website/screen/splash_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider
    (
      create: (BuildContext context)=>AccessTokenProvider(),
      child: const MyApp()

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
