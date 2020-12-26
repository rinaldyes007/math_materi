import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<Soal>> fetchSoal([http.Client client]) async {
  final response =
      await http.get('https://quizsma.000webhostapp.com/api/soal-pilgan-api');

  return compute(parseSoal, response.body);
}

List<Soal> parseSoal(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Soal>((json) => Soal.fromJson(json)).toList();
}

class Soal {
  String soal, jawaban_a, jawaban_b, jawaban_c, jawaban_d, jawaban_e;
  Soal(
      {this.soal,
      this.jawaban_a,
      this.jawaban_b,
      this.jawaban_c,
      this.jawaban_d,
      this.jawaban_e});

  factory Soal.fromJson(Map<String, dynamic> json) {
    return Soal(
        soal: json['soal'] as String,
        jawaban_a: json['pilihan_a'] as String,
        jawaban_b: json['pilihan_b'] as String,
        jawaban_c: json['pilihan_c'] as String,
        jawaban_d: json['pilihan_d'] as String,
        jawaban_e: json['pilihan_e']);
  }
}

// factory Soal.createSoal(Map<String, dynamic> object) {
//   return Soal(
//       soal: object['soal'].toString(),
//       jawaban_a: object['jawaban_a'].toString(),
//       jawaban_b: object['jawaban_b'].toString(),
//       jawaban_c: object['jawaban_c'].toString(),
//       jawaban_d: object['jawaban_d'].toString(),
//       jawaban_e: object['jawaban_e'].toString());
// }
//   static Future<List<Soal>> getSoal() async {
//     String apiUrl = "https://quizsma.000webhostapp.com/api/soal-pilgan-api";

//     var apiResult = await http.get(apiUrl);
//     var jsonObject = jsonDecode(apiResult.body);
//     List<dynamic> listSoal = (jsonObject as Map<String, dynamic>)['data'];

//     // List<Soal> soals = [];
//     // for (int i = 0; i < listSoal.length; i++) {
//     //   soals.add(Soal.createSoal(listSoal[i]));

//     //   return soals;
//   }
// }
