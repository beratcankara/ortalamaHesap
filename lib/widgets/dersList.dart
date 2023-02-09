import 'package:flutter/material.dart';
import 'package:ortalamahesaplama/constants/constants.dart';
import 'package:ortalamahesaplama/data/dersler_data.dart';
import 'package:ortalamahesaplama/model/ders.dart';

class dersList extends StatefulWidget {
  const dersList({super.key});

  @override
  State<dersList> createState() => _dersListState();
}

class _dersListState extends State<dersList> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DerslerData.tumDersler;
    return ListView.builder(
      itemCount: tumDersler.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.class_),
          subtitle: Text(tumDersler[index].harfDegeri.toString()),
          onLongPress: () {
            setState(() {
              tumDersler.remove(tumDersler[index]);
            });
          },
          title: Text(
            tumDersler[index].ad.toString(),
            style: Constants.dersTextStyle,
          ),
        );
      },
    );
  }
}
