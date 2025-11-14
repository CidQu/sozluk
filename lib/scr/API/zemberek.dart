import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sozluk/env.dart';

/// [Sozluk] is a class for making HTTP requests to the ZEMBEREK API.
class Sozluk {
  final ipAdresi = env.ipAdresi;
  final port = env.port;

  Uri _endpointUri(String endpoint) {
    final base = ipAdresi.trim();
    if (base.contains('://')) {
      final parsed = Uri.parse(base);
      final hasTrailingSlash = parsed.path.endsWith('/');
      final nextPath =
          hasTrailingSlash ? '${parsed.path}$endpoint' : '${parsed.path}/$endpoint';
      return parsed.replace(path: nextPath);
    }

    final normalizedHost = base.replaceAll(RegExp(r'^/+|/+$'), '');
    final parsedPort = int.tryParse(port);
    return Uri(
      scheme: 'http',
      host: normalizedHost,
      port: parsedPort,
      pathSegments: [endpoint],
    );
  }

  /// [spellingCheck] is a class for making HTTP requests to the ZEMBEREK API using the [word] parameter.
  Future<String> spellingCheck(String word) async {
    try {
      var url = _endpointUri('spelling_check');
      var res = await http.post(url, body: {'word': word});
      var body = res.body;
      var decoded = jsonDecode(body);
      var cevap = decoded["is_correct"];
      return cevap.toString();
    } on NoSuchMethodError {
      throw StateError("Probably System Error. Open an issue on GitHub.");
    } catch (e) {
      throw Exception("Failed to check spelling for '$word': $e");
    }
  }

  /// [generateWord] is a class for making HTTP requests to the ZEMBEREK API using the [sample] and [morphemes] parameter.
  Future<List<dynamic>> generateWord(String sample, String morphemes) async {
    try {
      var url = _endpointUri('generate_word');
      var res =
          await http.post(url, body: {'word': sample, 'morphemes': morphemes});
      var body = res.body;
      var decoded = jsonDecode(body);
      if (decoded is List && decoded.isEmpty) {
        throw StateError(
            "Zemberek returned no results for '$sample' with '$morphemes'.");
      }
      var json = decoded[0];
      var cevap = json["surface"];
      return cevap;
    } on NoSuchMethodError {
      throw StateError("Probably System Error. Open an issue on GitHub.");
    } catch (e) {
      throw Exception(
          "Failed to generate word for '$sample' and '$morphemes': $e");
    }
  }

  ///[lemmas] is a class for making HTTP requests to the ZEMBEREK API using the [word] parameter and print [word] in the console.
  Future<List<dynamic>> lemmas(String word) async {
    try {
      var url = _endpointUri('lemmas');
      var res = await http.post(url, body: {'word': word});
      var body = res.body;
      var decoded = jsonDecode(body);
      var results = decoded["results"] as List<dynamic>?;
      if (results == null || results.isEmpty) {
        throw StateError("Zemberek returned no lemmas for '$word'.");
      }
      var cevap = results[0]["lemmas"];
      return cevap;
    } on NoSuchMethodError {
      throw StateError("Probably System Error. Open an issue on GitHub.");
    } catch (e) {
      throw Exception("Failed to fetch lemmas for '$word': $e");
    }
  }

  /// [spellingSuggestions] is a class for making HTTP requests to the ZEMBEREK API using the [word] parameter and print [word] in the console.
  Future<List<dynamic>> spellingSuggestions(String word) async {
    try {
      var url = _endpointUri('spelling_suggestions');
      var res = await http.post(url, body: {'word': word});
      var body = res.body;
      var decoded = jsonDecode(body);
      var cevap = decoded["suggestions"];
      return cevap;
    } on NoSuchMethodError {
      throw StateError("Probably System Error. Open an issue on GitHub.");
    } catch (e) {
      throw Exception("Failed to fetch spelling suggestions for '$word': $e");
    }
  }

  /// [zemberekAPI] is a class for making HTTP requests to the ZEMBEREK API using the [endpoint] and [body] parameter.
  Future<String> zemberekAPI(String endpoint, String body) async {
    try {
      var url = _endpointUri(endpoint);
      var res = await http.post(url, body: body);
      var body1 = res.body;
      var decoded = jsonDecode(body1);
      return decoded;
    } on NoSuchMethodError {
      throw StateError("Probably System Error. Open an issue on GitHub.");
    } catch (e) {
      throw Exception("Failed to call zemberek endpoint '$endpoint': $e");
    }
  }
}
