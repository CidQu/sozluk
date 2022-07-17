import 'dart:convert';
import 'package:http/http.dart' as http;

/// [SozlukTr] is a class for making HTTP requests to the SOZLUK API.
class SozlukTr {
  /// [anlam] is a class for making HTTP requests to the SOZLUK API using the [word] parameter.
  Future<String> anlam(String word) async {
    try {
      var res = await http.Client()
          .get(Uri.parse('https://sozluk.gov.tr/gts?ara=$word'));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json["anlamlarListe"][0]["anlam"];
      return sozlukanlam;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "HATA-001 - Bu kelimeye ait anlam bulunamadı.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [atasozu] is a class for making HTTP requests to the SOZLUK API using the [word] parameter.
  Future<String> atasozu(String word) async {
    try {
      var res = await http.Client()
          .get(Uri.parse('https://sozluk.gov.tr/gts?ara=$word'));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json["atasozu"][0]["madde"];
      return sozlukanlam;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "HATA-002 - Bu kelimeye ait atasözü bulunamadı.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [sesUrl] is a class for making HTTP requests to the SOZLUK API using the [word] parameter.
  Future<String> sesUrl(String word) async {
    try {
      var res = await http.Client()
          .get(Uri.parse('https://sozluk.gov.tr/yazim?ara=$word'));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json["seskod"];
      print('Voice Code: $sozlukanlam');
      var anlamSesUrl = 'https://sozluk.gov.tr/ses/' + sozlukanlam + '.wav';
      return anlamSesUrl;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "HATA-003 - Bu kelimeye ait ses bulunamadı.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [getJson] is a class for making HTTP requests to the SOZLUK API using the [word] parameter.
  Future<String> getJson(String word) async {
    try {
      var res = await http.Client()
          .get(Uri.parse('https://sozluk.gov.tr/gts?ara=$word'));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json;
      return sozlukanlam.toString();
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam =
            "HATA-004 - Bu kelime bulunamadı, doğru yazıldığına emin olun.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }
}

/// [Sozluk] is a class for making HTTP requests to the SOZLUK API.
class Sozluk {
  /// [meaning] is a class for making HTTP requests to the SOZLUK API using the [word] parameter.
  Future<String> meaning(String word) async {
    try {
      var res = await http.Client()
          .get(Uri.parse('https://sozluk.gov.tr/gts?ara=$word'));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json["anlamlarListe"][0]["anlam"];
      return sozlukanlam;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "ERR-001 - Couldn't find any meaning.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [proverb] is a class for making HTTP requests to the SOZLUK API using the [word] parameter.
  Future<String> proverb(String word) async {
    try {
      var res = await http.Client()
          .get(Uri.parse('https://sozluk.gov.tr/gts?ara=$word'));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json["atasozu"][0]["madde"];
      return sozlukanlam;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "ERR-002 - Couldn't find any proverb with this word.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [audioUrl] is a class for making HTTP requests to the SOZLUK API using the [word] parameter and print [word] in the console.
  Future<String> audioUrl(String word) async {
    try {
      var res = await http.Client()
          .get(Uri.parse('https://sozluk.gov.tr/yazim?ara=$word'));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json["seskod"];
      print('Voice Code: $sozlukanlam');
      var anlamSesUrl = 'https://sozluk.gov.tr/ses/' + sozlukanlam + '.wav';
      return anlamSesUrl;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam =
            "ERR-003 - Couldn't find any audio files with this word.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [getJson] is a class for making HTTP requests to the SOZLUK API using the [word] parameter.
  Future<String> getJson(String word) async {
    try {
      var res = await http.Client()
          .get(Uri.parse('https://sozluk.gov.tr/gts?ara=$word'));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json;
      return sozlukanlam.toString();
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "ERR-004 - Couldn't find any json with this word.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }
}
