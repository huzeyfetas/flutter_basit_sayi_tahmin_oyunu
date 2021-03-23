import 'package:flutter/material.dart';
import 'package:guess_number/Font_Constant.dart';
import 'package:guess_number/TahminEkrani.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Tahmin Oyunu',
              style: FontConst.f22BoldGreen,
            ),
            Image.asset(
              "assets/zar_resim.png",
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TahminEkrani();
                  }));
                },
                child: Text(
                  'Oyun Başla',
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
