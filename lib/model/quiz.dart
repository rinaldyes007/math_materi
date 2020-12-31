import 'dart:convert';

class Quiz {
  Quiz({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<Data> data;

  factory Quiz.fromJson(String str) => Quiz.fromMap(json.decode(str));

  factory Quiz.fromMap(Map<String, dynamic> json) => Quiz(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Data>.from(json["data"].map((x) => Data.fromMap(x))),
      );
}

class Data {
  Data({
    this.noSoal,
    this.soal,
    this.jawaban,
    this.pilihanA,
    this.pilihanB,
    this.pilihanC,
    this.pilihanD,
    this.pilihanE,
    this.jawabanUser,
  });

  int noSoal;
  String soal;
  String jawaban;
  String pilihanA;
  String pilihanB;
  String pilihanC;
  String pilihanD;
  String pilihanE;
  String jawabanUser;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        noSoal: json["no_soal"] == null ? null : json["no_soal"],
        soal: json["soal"] == null ? null : json["soal"],
        jawaban: json["jawaban"] == null ? null : json["jawaban"],
        pilihanA: json["pilihan_a"] == null ? null : json["pilihan_a"],
        pilihanB: json["pilihan_b"] == null ? null : json["pilihan_b"],
        pilihanC: json["pilihan_c"] == null ? null : json["pilihan_c"],
        pilihanD: json["pilihan_d"] == null ? null : json["pilihan_d"],
        pilihanE: json["pilihan_e"] == null ? null : json["pilihan_e"],
      );
}
