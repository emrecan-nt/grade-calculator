import 'package:flutter/material.dart';
import 'package:ortalama_hesaplayici/sabitler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext Context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(Sabitler.baslik,style: Sabitler.baslikstyle),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text("helllo"),
      ),
    );
  }
}
