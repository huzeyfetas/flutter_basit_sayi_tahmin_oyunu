import 'dart:math';
import 'package:flutter/material.dart';
import 'package:guess_number/Font_Constant.dart';
import 'package:guess_number/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var tfController = TextEditingController();
  int kalanHak = 5;
  String msj = '';
  int rastgeleSayi = 0;
  bool yon = false;

  @override
  void initState() {
    rastgeleSayi = Random().nextInt(101);
    print('Rastgele Sayi -> $rastgeleSayi');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TAHMİN',
          style: FontConst.f22BoldGreen,
        ),
        iconTheme: IconThemeData(color: Colors.green),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Kalan Hak : $kalanHak',
              style: FontConst.f22BoldGreen,
            ),
            if (kalanHak != 5)
              Yonlendirme(
                kalanHak: kalanHak,
                msj: msj,
                yon: yon,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: tfController,
                textAlign: TextAlign.center,
                //decoration: InputDecoration.collapsed(hintText: 'Tahmin'),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.border_color),
                  suffixStyle: TextStyle(color: Colors.green),
                  labelText: 'Tahmin',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (tfController.text != '') {
                    int sonTahmin = int.parse(tfController.text);

                    if (sonTahmin > rastgeleSayi) {
                      setState(() {
                        msj = 'Tahmini azalt';
                        yon = false;

                        kalanHak--;
                      });
                    } else if (sonTahmin < rastgeleSayi) {
                      setState(() {
                        msj = 'Tahmini arttır';
                        yon = true;
                        kalanHak--;
                      });
                    }
                    if (kalanHak == 0 || rastgeleSayi == sonTahmin) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return SonucEkrani(kalanHak, rastgeleSayi);
                      }));
                    }
                    tfController.text = '';
                  } else {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Hata'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Bir değer girmelisin'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'Tahmin et',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[300],
                  onPrimary: Colors.white54,
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

class Yonlendirme extends StatelessWidget {
  final int kalanHak;
  final String msj;
  final bool yon;

  Yonlendirme({this.kalanHak, this.msj, this.yon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Yönlendirme : $msj',
          style: FontConst.f22BoldGreen300,
        ),
        yon
            ? Icon(
                Icons.arrow_upward,
                color: Colors.white54,
                size: 25,
              )
            : Icon(
                Icons.arrow_downward,
                color: Colors.white54,
                size: 25,
              ),
      ],
    );
  }
}
