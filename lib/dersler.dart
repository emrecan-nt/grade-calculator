import 'package:flutter/material.dart';
import 'package:ortalama_hesaplayici/data.dart';
import 'package:ortalama_hesaplayici/model.dart';
import 'package:ortalama_hesaplayici/sabitler.dart';

class DersListesi extends StatefulWidget {
  final Function onElamanCikar;

  const DersListesi({super.key, required this.onElamanCikar});

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumdersler = data.eklenecekDers;
    return tumdersler.length > 0
        ? ListView.builder(
            itemCount: tumdersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  widget.onElamanCikar(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumdersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumdersler[index].harfDegeri *
                                tumdersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          '${tumdersler[index].krediDegeri} Kredi,Not Değeri${tumdersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(
                child:
                    Text('Lütfen Ders Ekleyin', style: Sabitler.baslikstyle)),
          );
  }
}
