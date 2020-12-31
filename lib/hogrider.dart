import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:math_materi/model/quiz.dart';
import 'package:html_unescape/html_unescape.dart';

class QuizPage extends StatefulWidget {
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int benar = 0;
  int salah = 0;
  var unescape = new HtmlUnescape();

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
          SizedBox(
            height: 80,
          ),
          Text(
            unescape
                .convert(dataQuiz[0].soal)
                .replaceAll("<p>", "")
                .replaceAll("</p>", " ?"),
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 70.0, vertical: 40.0),
            child: Column(
              children: [
                button(
                    'A', dataQuiz[0].pilihanA, dataQuiz[0].jawaban, dataQuiz),
                button(
                    'B', dataQuiz[0].pilihanB, dataQuiz[0].jawaban, dataQuiz),
                button(
                    'C', dataQuiz[0].pilihanC, dataQuiz[0].jawaban, dataQuiz),
                button(
                    'D', dataQuiz[0].pilihanD, dataQuiz[0].jawaban, dataQuiz),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              for (var i = 0; i < dataQuiz.length; i++) {
                if (dataQuiz[i].jawabanUser == dataQuiz[i].jawaban) {
                  benar++;
                } else {
                  salah++;
                }
              }
              print(dataQuiz[0].jawabanUser);
              print("Benar $benar");
              print("Salah $salah");
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              height: 60,
              width: 100,
              child: Center(
                  child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              )),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  button(String optionAbjad, String optionValue, String jawaban,
      List<Data> dataQuiz) {
    return GestureDetector(
      onTap: () {
        // if (optionValue == jawaban) {
        //   benar++;
        // } else {
        //   salah++;
        // }
        dataQuiz[0].jawabanUser = optionValue;
        print('triger');
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
}
