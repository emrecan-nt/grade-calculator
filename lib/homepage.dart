import 'package:flutter/material.dart';
import 'package:ortalama_hesaplayici/data.dart';
import 'package:ortalama_hesaplayici/dersler.dart';
import 'package:ortalama_hesaplayici/harf_dropdown.dart';
import 'package:ortalama_hesaplayici/kredi_dropdown.dart';
import 'package:ortalama_hesaplayici/model.dart';
import 'package:ortalama_hesaplayici/ortalama.dart';
import 'package:ortalama_hesaplayici/sabitler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDers = '';
  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                child: OrtalamaGoster(
                    dersSayisi: data.eklenecekDers.length,
                    ortalama: data.ortalamaHesapla()),
              ),
            ],
          ),
          Expanded(
            child: DersListesi(
              onElamanCikar: (index) {
                print('index: $index');
                data.eklenecekDers.removeAt(index);
                setState(() {});
              },
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
          Padding(
            padding: Sabitler.YatayPadding8,
            child: _buildTextformfiled(),
          ),
          Padding(padding: Sabitler.YatayPadding8),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.YatayPadding8,
                  child: HarfDropdown(
                    onHarfSecildi: (harf) {
                      secilenDeger=harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.YatayPadding8,
                  child: KrediDropdown(onKrediSecildi: (kredi){
                    secilenKrediDeger=kredi;
                  }),
                ),
              ),
              IconButton(
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildTextformfiled() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDers = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders Adını Giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: 'Ders Adı',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100,
      ),
    );
  }

 

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDers,
          harfDegeri: secilenDeger,
          krediDegeri: secilenKrediDeger);
      data.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
