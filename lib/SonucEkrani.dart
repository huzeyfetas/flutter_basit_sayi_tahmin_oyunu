import 'package:flutter/material.dart';

import 'Font_Constant.dart';

class SonucEkrani extends StatefulWidget {
  var sonuc;
  var rastgeleSayi;

  SonucEkrani(this.sonuc, this.rastgeleSayi);

  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  String imgPath;
  String msj;
  @override
  Widget build(BuildContext context) {
    int score = widget.sonuc;
    if (score > 0) {
      imgPath = 'assets/mutlu_resim.png';
      msj = 'TEBRİKLER KAZANDIN';
    } else {
      imgPath = 'assets/uzgun_resim.png';
      msj = 'MAALESEF KAYBETTİN';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SONUC',
          style: FontConst.f22BoldGreen,
        ),
        iconTheme: IconThemeData(color: Colors.green),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(imgPath),
            Text(
              'TAHMİN EDİLMESİ GEREKEN SAYI : ${widget.rastgeleSayi}',
              style: FontConst.f22BoldGreen,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              msj,
              style: FontConst.f22BoldGreen,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Tekrar Oyna',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white24,
                  onPrimary: Colors.green,
                  textStyle: FontConst.f22BoldGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
