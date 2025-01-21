import 'package:flutter/material.dart';
import 'package:ortalama_hesaplayici/data.dart';
import 'package:ortalama_hesaplayici/sabitler.dart';

class HarfDropdown extends StatefulWidget {
   final Function onHarfSecildi;
  const HarfDropdown({required this.onHarfSecildi,Key? key}):super(key: key);
 

  @override
  State<HarfDropdown> createState() => _HarfDropdownState();
}

class _HarfDropdownState extends State<HarfDropdown> {
  double secilenDeger = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
           widget.onHarfSecildi(deger);
          });
        },
        underline: Container(),
        items: data.harfNotlari(),
      ),
    );
  }
  }
  
