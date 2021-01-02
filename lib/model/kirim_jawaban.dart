import 'package:http/http.dart' as http;
import 'dart:convert';

class kirimJawaban {
  String jum_bnr;
  String jum_slh;

  kirimJawaban({this.jum_bnr, this.jum_slh});

  factory kirimJawaban.fromJson(Map<String, dynamic> object) {
    return kirimJawaban(
        jum_bnr: object['jum_benar'], jum_slh: object['jum_salah']);
  }

  // static Future<kirimJawaban> connectToAPI(
  //     String jum_bnr, String jum_slh) async {
  //   String apiUrl = "https://quizsma.000webhostapp.com/api/jawab_soal/1";
  //   var apiResult = await http
  //       .post(apiUrl, body: {"jum_benar": jum_bnr, "jum_salah": jum_slh});
  //   var jsonObject = json.decode(apiResult.body);
  //   if (apiResult.body == 200) {
  //     print("ok");
  //   }

  //   return kirimJawaban.createKirimJawaban(jsonObject);
  // }
}
