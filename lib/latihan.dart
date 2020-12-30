import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:html_unescape/html_unescape.dart';

import 'model/soal.dart';

class LatihanPage extends StatefulWidget {
  @override
  _LatihanPageState createState() => _LatihanPageState();
}

class _LatihanPageState extends State<LatihanPage> {
  var unescape = new HtmlUnescape();
  String oke, parser;

  String output = "no";
  String option1 = "no", option2 = "no", option3 = "no", option4 = "no";
  String jawaban;
  var index = 1;
  var benar = 0;
  var salah = 0;

  @override
  void initState() {
    super.initState();
    Soal.getSoals().then((soals) {
      output = "";
      option1 = "";
      option2 = "";
      option3 = "";
      option4 = "";
      jawaban = "";
      setState(() {
        output = output + soals[index].soall;
        option1 = option1 + soals[index].pilihanA;
        option2 = option2 + soals[index].pilihanB;
        option3 = option3 + soals[index].pilihanC;
        option4 = option4 + soals[index].pilihanD;
        jawaban = jawaban + soals[index].jawaban;
      });
    });
  }

  Widget choiceButton(String str) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: MaterialButton(
        onPressed: () {
          if (option1 == jawaban) {
            benar++;
          } else if (option2 == jawaban) {
            benar++;
          } else if (option3 == jawaban) {
            benar++;
          } else if (option4 == jawaban) {
            benar++;
          } else {
            salah++;
          }
          print(salah);
          setState(() {});
        },
        child: Text(
          str,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          maxLines: 1,
        ),
        highlightColor: Colors.indigo[700],
        splashColor: Colors.indigo[700],
        color: Colors.indigoAccent,
        minWidth: 200,
        height: 45,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Latihan"),
            content: Text("Maaf anda tidak bisa kembali"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"))
            ],
          ),
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    unescape
                        .convert(output)
                        .replaceAll("<p>", "")
                        .replaceAll("</p>", " ?"),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  choiceButton(option1),
                  choiceButton(option2),
                  choiceButton(option3),
                  choiceButton(option4)
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    "30",
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
