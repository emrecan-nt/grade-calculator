import 'package:flutter/material.dart';
import 'package:ortalama_hesaplayici/data.dart';
import 'package:ortalama_hesaplayici/ortalama.dart';
import 'package:ortalama_hesaplayici/sabitler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey formKey = GlobalKey<FormState>();
  double secilenDeger = 4;
  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(Sabitler.baslik, style: Sabitler.baslikstyle),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //form
          Row(
            children: [
              Expanded(flex: 2, child: _buildForm()),
              Expanded(
                child: OrtalamaGoster(dersSayisi: 1, ortalama: 4.2563),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: Text('Liste buraya gelecek'),
              color: Colors.yellowAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextformfiled(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHarfler(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.accessibility_new_rounded)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.accessibility_new_rounded)),
            ],
          ),
        ],
      ),
    );
  }

  _buildTextformfiled() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100,
      ),
    );
  }

  _buildHarfler() {
    return Container(
      padding: Sabitler.DropdownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenDeger,
        onChanged: (deger) {
          setState(() {
            secilenDeger = deger!;
            print(deger);
          });
        },
        underline: Container(),
        items: data.harfNotlari(),
      ),
    );
  }
}
