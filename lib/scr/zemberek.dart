import 'dart:convert';
import 'package:http/http.dart' as http;

/// [Sozluk] is a class for making HTTP requests to the ZEMBEREK API.
class Sozluk { 
  /// [spellingCheck] is a class for making HTTP requests to the ZEMBEREK API using the [word] parameter.
  Future<String> spellingCheck(String word) async {
    try {
      var url = (Uri.parse('http://213.238.177.122:4567/spelling_check'));
      var res = await http.post(url, body: {'word': word});
      var body = res.body;
      var decoded = jsonDecode(body);
      var cevap = decoded["is_correct"];
      return cevap.toString();
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "Probably System Error. Open an issue on GitHub.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [generateWord] is a class for making HTTP requests to the ZEMBEREK API using the [sample] and [morphemes] parameter.
  Future<String> generateWord(String sample, String morphemes) async {
    try {
      var url = (Uri.parse('http://213.238.177.122:4567/generate_word'));
      var res = await http.post(url, body: {'word': sample, 'morphemes': morphemes});
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var cevap = json["surface"];
      return cevap;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "Probably System Error. Open an issue on GitHub.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [lemmas] is a class for making HTTP requests to the ZEMBEREK API using the [word] parameter and print [word] in the console.
  Future<String> lemmas(String word) async {
    try {
      var url = (Uri.parse('http://213.238.177.122:4567/lemmas'));
      var res = await http.post(url, body: {'word': word});
      var body = res.body;
      var decoded = jsonDecode(body);
      var cevap = decoded["results"][0]["lemmas"];
      return cevap;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "Probably System Error. Open an issue on GitHub.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [spellingSuggestions] is a class for making HTTP requests to the ZEMBEREK API using the [word] parameter and print [word] in the console.
  Future<String> spellingSuggestions(String word) async {
    try {
      var url = (Uri.parse('http://213.238.177.122:4567/spelling_suggestions'));
      var res = await http.post(url, body: {'word': word});
      var body = res.body;
      var decoded = jsonDecode(body);
      var cevap = decoded["suggestions"];
      return cevap;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "Probably System Error. Open an issue on GitHub.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }

  /// [zemberekAPI] is a class for making HTTP requests to the ZEMBEREK API using the [endpoint] and [body] parameter.
  Future<String> zemberekAPI(String endpoint, String body) async {
    try {
      var url = (Uri.parse('http://213.238.177.122:4567/$endpoint'));
      var res = await http.post(url, body: body);
      var body1 = res.body;
      var decoded = jsonDecode(body1);
      return decoded;
    } catch (e) {
      var hata = e.toString();
      if (hata.contains('NoSuchMethodError')) {
        var sozlukanlam = "Probably System Error. Open an issue on GitHub.";
        return sozlukanlam;
      } else {
        var sozlukanlam = e.toString();
        return sozlukanlam;
      }
    }
  }
}