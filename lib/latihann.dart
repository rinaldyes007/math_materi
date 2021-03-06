import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:math_materi/dashboard.dart';
import 'package:math_materi/model/kirim_jawaban.dart';
import 'package:math_materi/model/quiz.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login2.dart';

class QuizPage extends StatefulWidget {
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int benar = 0;
  int salah = 0;
  var unescape = new HtmlUnescape();
  int currentIndex = 0;
  int index = 0;

  // Future<http.Response> sendAnswer() {
  //   return http.post(
  //     'https://quizsma.000webhostapp.com/api/jawab_soal/1',
  //     body: jsonEncode(<String, String>{
  //       'jum_benar': benar.toString(),
  //       'jum_salah': salah.toString()
  //     }),
  //   );
  // }
  Future<int> getId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('idd') ?? null;
  }

  Future<kirimJawaban> sendAnswer(String bnr, String slh) async {
    final http.Response response = await http.post(
      'https://quizsma.000webhostapp.com/api/jawab_soal/$id_user',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'jum_benar': bnr, 'jum_salah': slh}),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      return kirimJawaban.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future getQuiz() async {
    final String baseUrl =
        "https://quizsma.000webhostapp.com/api/soal-pilgan-api";
    final response = await http.get('$baseUrl');
    if (response.statusCode == 200) {
      return Quiz.fromJson(response.body);
    } else {
      throw Exception('Fail load data');
    }
  }

  int id_user = 0;
  @override
  void initState() {
    getId().then((s) {
      id_user = s;
    });

    super.initState();
  }

  button(String optionAbjad, String optionValue, String jawaban,
      List<Data> dataQuiz, int indx) {
    return GestureDetector(
      onTap: () {
        if (optionValue == jawaban) {
          benar++;
        } else {
          salah++;
        }

        if (index == dataQuiz.length - 1) {
          print("benar total $benar");
          print("salah total $salah");
          sendAnswer(benar.toString(), salah.toString());
          Navigator.of(context).pop(context);
        } else {
          index++;
        }

        setState(() {});
        print("benar $benar");
        print("salah $salah");
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            optionValue,
            maxLines: 1,
            style: TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // buttonNext(String jawabanku, String kunci) {
  //   return MaterialButton(
  //     minWidth: 140,
  //     height: 45,
  //     onPressed: () {
  //       index++;
  //       setState(() {});
  //     },
  //     color: Colors.green,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //     child: Text(
  //       "Next",
  //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
  //     ),
  //   );
  // }

  // buttonBack() {
  //   return MaterialButton(
  //     minWidth: 140,
  //     height: 45,
  //     onPressed: () {
  //       index--;
  //       setState(() {});
  //       print(index);
  //       //nextIndex(dataQuiz.length);
  //     },
  //     color: Colors.red,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //     child: Text(
  //       "Back",
  //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
  //     ),
  //   );
  // }

  // void nextIndex(int length) {
  //   index++;
  //   setState(() {
  //     print(index);
  //   });
  // }

  // buttonNext(int nextIndex) {
  //   return MaterialButton(
  //     onPressed: () {
  //       setState(() {
  //         nextIndex++;
  //         return nextIndex;
  //       });
  //     },
  //     color: Colors.indigoAccent,
  //     child: Text("Next"),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getQuiz(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            // return Center(
            //   child: Text('Berhasil'),
            // );
            // print(snapshot.data.data);
            // return Center(
            //   child: Text('Berhasil'),
            // );
            return contentQuiz(snapshot.data.data);

            //return contentQuiz(snapshot.data.data);
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }
        },
      ),
    );
  }

  contentQuiz(List<Data> dataQuiz) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                unescape
                    .convert(dataQuiz[index].soal)
                    .replaceAll("<p>", "")
                    .replaceAll("</p>", " ?"),
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0),
                child: Column(
                  children: [
                    button(
                      'A',
                      dataQuiz[index].pilihanA,
                      dataQuiz[index].jawaban,
                      dataQuiz,
                      index,
                    ),
                    button('B', dataQuiz[index].pilihanB,
                        dataQuiz[index].jawaban, dataQuiz, index),
                    button('C', dataQuiz[index].pilihanC,
                        dataQuiz[index].jawaban, dataQuiz, index),
                    button('D', dataQuiz[index].pilihanD,
                        dataQuiz[index].jawaban, dataQuiz, index),
                  ],
                ),
              ),
              // Container(
              //     child: index == dataQuiz.length - 1
              //         ? GestureDetector(
              //             onTap: () {
              //               print("benar total $benar");
              //               print("salah total $salah");
              //               //   // for (var i = 0; i < dataQuiz.length; i++) {
              //               //   if (dataQuiz[index].jawabanUser ==
              //               //       dataQuiz[index].jawaban) {
              //               //     benar++;
              //               //   } else if (dataQuiz[index].jawabanUser !=
              //               //           dataQuiz[index].jawaban &&
              //               //       dataQuiz[index].jawabanUser != "" &&
              //               //       dataQuiz[index].jawabanUser != null) {
              //               //     salah++;
              //               //   }
              //               //   //   }

              //               //   print(dataQuiz[index].jawabanUser);
              //               //   print("Benar $benar");
              //               //   print("Salah $salah");
              //             },
              //             // child: Container(
              //             //   margin: EdgeInsets.all(5.0),
              //             //   height: 60,
              //             //   width: 100,
              //             //   child: Center(
              //             //       child: Text(
              //             //     'Submit',
              //             //     style: TextStyle(color: Colors.white),
              //             //   )),
              //             //   decoration: BoxDecoration(
              //             //     color: Colors.blueAccent,
              //             //     borderRadius: BorderRadius.circular(10),
              //             //   ),
              //             // ),
              //           )
              //         : null)
            ],
          ),
        ],
      ),
    );
  }
}
