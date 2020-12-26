import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_materi/model/soal.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class LatihanPage extends StatefulWidget {
  @override
  _LatihanPageState createState() => _LatihanPageState();
}

class _LatihanPageState extends State<LatihanPage> {
  Widget choiceButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "Option",
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
                child: FutureBuilder<List<Soal>>(
                    future: fetchSoal(http.Client()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          "  snapshot.",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  choiceButton(),
                  choiceButton(),
                  choiceButton(),
                  choiceButton()
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
