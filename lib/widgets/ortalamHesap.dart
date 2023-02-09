import 'package:flutter/material.dart';
import 'package:ortalamahesaplama/constants/constants.dart';

class ortalamaHesap extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const ortalamaHesap(
      {super.key, required this.ortalama, required this.dersSayisi});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi ders girildi." : "Ders giriniz.",
          style: Constants.dersTextStyle,
        ),
        Text(
          ortalama.isNaN ? "0" : ortalama.toStringAsFixed(2),
          style: Constants.ortTextStyle,
        ),
        Text(
          "Ortalama",
          style: Constants.ortalamaTextStyle,
        ),
      ],
    );
  }
}
