import 'package:flutter/material.dart';
import 'package:ortalama_hesaplayici/data.dart';
import 'package:ortalama_hesaplayici/sabitler.dart';

class KrediDropdown extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdown({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  State<KrediDropdown> createState() => _KrediDropdownState();
}

class _KrediDropdownState extends State<KrediDropdown> {
  double secilenKrediDeger = 1;
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
        value: secilenKrediDeger,
        onChanged: (deger) {
          setState(() {
            secilenKrediDeger = deger!;
            widget.onKrediSecildi(deger);
            print(deger);
          });
        },
        underline: Container(),
        items: data.tumkrediler(),
      ),
    );
  }
}
