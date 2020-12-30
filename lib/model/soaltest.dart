// To parse this JSON data, do
//
//     final soals = soalsFromJson(jsonString);

import 'dart:convert';

List<Soal> soalsFromJson(String str) => List<Soal>.from(json.decode(str).map);

String soalsToJson(Soal data) => json.encode(data.toJson());

class Soal {
  Soal({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory Soal.fromJson(Map<String, dynamic> json) => Soal(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.noSoal,
    this.soal,
    this.jawaban,
    this.pilihanA,
    this.pilihanB,
    this.pilihanC,
    this.pilihanD,
    this.pilihanE,
  });

  int noSoal;
  String soal;
  String jawaban;
  String pilihanA;
  String pilihanB;
  String pilihanC;
  String pilihanD;
  String pilihanE;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        noSoal: json["no_soal"],
        soal: json["soal"],
        jawaban: json["jawaban"],
        pilihanA: json["pilihan_a"],
        pilihanB: json["pilihan_b"],
        pilihanC: json["pilihan_c"],
        pilihanD: json["pilihan_d"],
        pilihanE: json["pilihan_e"],
      );

  Map<String, dynamic> toJson() => {
        "no_soal": noSoal,
        "soal": soal,
        "jawaban": jawaban,
        "pilihan_a": pilihanA,
        "pilihan_b": pilihanB,
        "pilihan_c": pilihanC,
        "pilihan_d": pilihanD,
        "pilihan_e": pilihanE,
      };
}
