import 'package:first_aid_assisstant/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Aid Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homescreen()
    );
  }
}


