import 'package:flutter/cupertino.dart';
import 'package:ortalamahesaplama/model/ders.dart';

class DerslerData {
  static List<Ders> tumDersler = [];

  static dersEkle(Ders eklenecekDers) {
    tumDersler.add(eklenecekDers);
  }

  static ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumDersler.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    });
    return toplamNot / toplamKredi;
  }
}
