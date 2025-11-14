import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sozluk/sozluk.dart';

void sozluk() async {
  var sozluk = Sozluk().dictionary;
  var word = "Dalga";
  var meanings = await sozluk.meaning(word);

  var proverbs = await sozluk.proverb(word);

  var audio = await sozluk.audioUrl(word);
  debugPrint("Meanings: $meanings");
  debugPrint("Proverbs: $proverbs");
  debugPrint("Audio: $audio");
}

void main() async {
  var sozluk = Sozluk().zemberek;
  var word = "Dalga";
  var morphemes = "Verb+Fut+Past+A3sg";

  var spelling_check = await sozluk.spellingCheck(word);
  var generate_word = await sozluk.generateWord(word, morphemes);
  var lemmas = await sozluk.lemmas(word);
  var spelling_suggestions = await sozluk.spellingSuggestions(word);

  debugPrint("Spelling Check: $spelling_check");
  debugPrint("Generate Word: $generate_word");
  debugPrint("Lemmas: $lemmas");
  debugPrint("Spelling Suggestions: $spelling_suggestions");
}

void zemberekBackend() async {
  var sozluk = Sozluk().zemberek;
  var word = "Dalga";
  var endpoint = 'spelling_check';
  var jsonBody = '{"word": "$word"}';

  var response = await sozluk.zemberekAPI(endpoint, jsonBody);
  var jsonResponse = json.decode(response);
  var result = jsonResponse['is_correct'];
  debugPrint("Response: $result");
}
