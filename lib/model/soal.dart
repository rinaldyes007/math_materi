import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:html/parser.dart';

class Soal {
  String soall;
  String pilihanA;
  String pilihanB;
  String pilihanC;
  String pilihanD;
  String pilihanE;
  String jawaban;

  Soal(
      {this.soall,
      this.pilihanA,
      this.pilihanB,
      this.pilihanC,
      this.pilihanD,
      this.pilihanE,
      this.jawaban});

  factory Soal.createSoal(Map<String, dynamic> object) {
    return Soal(
      soall: object['soal'].toString(),
      pilihanA: object['pilihan_a'],
      pilihanB: object['pilihan_b'],
      pilihanC: object['pilihan_c'],
      pilihanD: object['pilihan_d'],
      pilihanE: object['pilihan_e'],
      jawaban: object['jawaban'],
    );
  }

  static Future<List<Soal>> getSoals() async {
    String apiUrl = "https://quizsma.000webhostapp.com/api/soal-pilgan-api";
    var apiResult = await http.get(apiUrl);
    var jsonObject = jsonDecode(apiResult.body);

    List<dynamic> listSoal = (jsonObject as Map<String, dynamic>)['data'];

    List<Soal> soals = [];
    for (int i = 0; i < listSoal.length; i++)
      soals.add(Soal.createSoal(listSoal[i]));

    parse(soals.toString()).documentElement.text;
    return soals;
  }
}
