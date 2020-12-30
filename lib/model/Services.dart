import 'package:http/http.dart' as http;
import 'soaltest.dart';

class Services {
  static const String url = "";

  static Future<List<Soal>> getSoal() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Soal> soals = soalsFromJson(response.body);
        return soals;
      } else {
        return List<Soal>();
      }
    } catch (e) {
      return List<Soal>();
    }
  }
}
