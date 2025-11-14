import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// [Sozluk] is a class for making HTTP requests to the SOZLUK API.
class Sozluk {
  static const _host = 'sozluk.gov.tr';

  // Dart SDK User Agent'ını kullanmak görünüşe göre TDK tarafından engelleniyor artık
  // Böyle bir şekilde şimdilik çözüm ürettim, bunu tekrardan düzenlemek gerekiyor.
  static const _headers = {
    'User-Agent':
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Sozluk/2.4',
    'Accept': 'application/json, text/javascript, */*; q=0.1',
    'Referer': 'https://sozluk.gov.tr/',
  };

  Uri _gtsUri(String word) => Uri.https(_host, '/gts', {'ara': word});

  Uri _yazimUri(String word) => Uri.https(_host, '/yazim', {'ara': word});

  Future<http.Response> _get(Uri uri) async {
    final res = await http.get(uri, headers: _headers);
    if (res.statusCode != 200) {
      throw HttpException(
          'TDK request failed with status ${res.statusCode}', uri: uri);
    }
    return res;
  }

  /// [meaning] fetches all meanings for the [word] parameter.
  Future<List<String>> meaning(String word) async {
    try {
      final res = await _get(_gtsUri(word));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var meanings = (json["anlamlarListe"] as List<dynamic>)
          .map((item) => item["anlam"].toString())
          .toList();
      if (meanings.isEmpty) {
        throw StateError("ERR-001 - Couldn't find any meaning.");
      }
      return meanings;
    } on NoSuchMethodError {
      throw StateError("ERR-001 - Couldn't find any meaning.");
    } catch (e) {
      throw Exception("Failed to fetch meaning for '$word': $e");
    }
  }

  /// [proverb] fetches all matching proverbs for the [word] parameter.
  Future<List<String>> proverb(String word) async {
    try {
      final res = await _get(_gtsUri(word));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var atasozu = json["atasozu"] as List<dynamic>?;
      if (atasozu == null || atasozu.isEmpty) {
        throw StateError(
            "ERR-002 - Couldn't find any proverb with this word.");
      }
      var proverbs =
          atasozu.map((item) => item["madde"].toString()).toList();
      return proverbs;
    } on NoSuchMethodError {
      throw StateError(
          "ERR-002 - Couldn't find any proverb with this word.");
    } catch (e) {
      throw Exception("Failed to fetch proverb for '$word': $e");
    }
  }

  /// [audioUrl] is a class for making HTTP requests to the SOZLUK API using the [word] parameter and print [word] in the console.
  Future<String> audioUrl(String word) async {
    try {
      final res = await _get(_yazimUri(word));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json["seskod"];
      debugPrint('Voice Code: $sozlukanlam');
      var anlamSesUrl = 'https://sozluk.gov.tr/ses/' + sozlukanlam + '.wav';
      return anlamSesUrl;
    } on NoSuchMethodError {
      throw StateError(
          "ERR-003 - Couldn't find any audio files with this word.");
    } catch (e) {
      throw Exception("Failed to fetch audio url for '$word': $e");
    }
  }

  /// [getJson] is a class for making HTTP requests to the SOZLUK API using the [word] parameter.
  Future<String> getJson(String word) async {
    try {
      final res = await _get(_gtsUri(word));
      var body = res.body;
      var decoded = jsonDecode(body);
      var json = decoded[0];
      var sozlukanlam = json;
      return sozlukanlam.toString();
    } on NoSuchMethodError {
      throw StateError("ERR-004 - Couldn't find any json with this word.");
    } catch (e) {
      throw Exception("Failed to fetch json for '$word': $e");
    }
  }
}
