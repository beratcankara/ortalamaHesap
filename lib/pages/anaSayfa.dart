import 'package:flutter/material.dart';
import 'package:ortalamahesaplama/constants/constants.dart';
import 'package:ortalamahesaplama/widgets/dersList.dart';
import 'package:ortalamahesaplama/widgets/formTop.dart';

class anaSayfa extends StatefulWidget {
  const anaSayfa({super.key});
  @override
  State<anaSayfa> createState() => _anaSayfaState();
}

class _anaSayfaState extends State<anaSayfa> {
  bool modeState = false;
  Color colormode = Constants.bgColor;
  Color appColorMode = Constants.appBarColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ortalama Hesaplama',
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: colormode)),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.color_lens),
          backgroundColor: appColorMode,
          onPressed: () {
            setState(() {
              appColorMode = modeState == false
                  ? Constants.secondColor
                  : Constants.bgColor;
              colormode = modeState == false
                  ? Constants.bgColor
                  : Constants.secondColor;
              modeState = modeState == false ? true : false;
            });
          },
        ),
        backgroundColor: colormode,
        appBar: AppBar(
          title: Text(
            "ORTALAMA HESAPLAMA",
            style: Constants.titleTextStyle,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: formTop(),
        ),
      ),
    );
  }
}
