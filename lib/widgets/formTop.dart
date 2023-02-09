import 'package:flutter/material.dart';
import 'package:ortalamahesaplama/constants/constants.dart';
import 'package:ortalamahesaplama/data/dersler_data.dart';
import 'package:ortalamahesaplama/model/ders.dart';
import 'package:ortalamahesaplama/widgets/dersList.dart';
import 'package:ortalamahesaplama/widgets/ortalamHesap.dart';

class formTop extends StatefulWidget {
  const formTop({super.key});

  @override
  State<formTop> createState() => _formTopState();
}

class _formTopState extends State<formTop> {
  double? secilenDeger = 4;
  double? secilenKredi = 5;
  String girilenDersAdi = "";
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: _buildForm(),
                ),
                flex: 2),
            Expanded(
                child: ortalamaHesap(
                    ortalama: DerslerData.ortalamaHesapla(),
                    dersSayisi: DerslerData.tumDersler.length),
                flex: 1),
          ],
        ),
        Expanded(
            child: Container(
          child: dersList(),
        )),
      ],
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHarfler(),
              _buildKrediler(),
              IconButton(
                  onPressed: _dersEkleveOrtalamaHesapla,
                  icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onChanged: (value) {
        setState(
          () {
            girilenDersAdi = value;
          },
        );
      },
      validator: (value) {
        if (value!.length <= 0) {
          return "Ders adını giriniz !";
        }
      },
      decoration: InputDecoration(
        hintText: "Eklemek istediğiniz dersi girin.",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
    );
  }

  _buildHarfler() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Constants.thirdColor.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: DropdownButton(
        value: secilenDeger,
        items: [
          DropdownMenuItem(
            child: Text("AA"),
            value: 4,
          ),
          DropdownMenuItem(
            child: Text("BA"),
            value: 3.5,
          ),
          DropdownMenuItem(
            child: Text("BB"),
            value: 3,
          ),
          DropdownMenuItem(
            child: Text("CB"),
            value: 2.5,
          ),
          DropdownMenuItem(
            child: Text("CC"),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text("DC"),
            value: 1.5,
          ),
          DropdownMenuItem(
            child: Text("DD"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("FF"),
            value: 0,
          ),
        ],
        onChanged: (value) {
          setState(() {
            secilenDeger = value!.toDouble();
          });
        },
      ),
    );
  }

  _buildKrediler() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Constants.thirdColor.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: DropdownButton(
        value: secilenKredi,
        items: [
          DropdownMenuItem(
            child: Text("6"),
            value: 6,
          ),
          DropdownMenuItem(
            child: Text("5"),
            value: 5,
          ),
          DropdownMenuItem(
            child: Text("4"),
            value: 4,
          ),
          DropdownMenuItem(
            child: Text("3"),
            value: 3,
          ),
          DropdownMenuItem(
            child: Text("2"),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text("1"),
            value: 1,
          ),
        ],
        onChanged: (value) {
          setState(() {
            secilenKredi = value!.toDouble();
          });
        },
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    setState(() {
      if (formKey.currentState!.validate()) {
        var eklenecekDers = Ders(
            ad: girilenDersAdi,
            harfDegeri: secilenDeger!,
            krediDegeri: secilenKredi!);
        debugPrint(eklenecekDers.toString());
        DerslerData.dersEkle(eklenecekDers);
        debugPrint(DerslerData.ortalamaHesapla().toString());
      }
    });
  }
}
