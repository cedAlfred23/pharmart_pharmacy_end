import 'package:flutter/material.dart';
import 'package:pharmacy_end/login.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

void main() {
   ZIMKit().init(
    appID: 1710962243,
    appSign: "bbcd721ab23af6aef013e193fc6e6c3a564faebb65d5834bb25a44fa75a91644",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
