import 'package:flutter/material.dart';
import 'package:ortalama_hesaplayici/homepage.dart';
import 'package:ortalama_hesaplayici/sabitler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext Context) {
    return MaterialApp(
      title: 'ortalama hesaplayıcı',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
