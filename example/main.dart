import 'package:sozluk/sozluk.dart';

void anlam() async {
  var sozluk = Sozluk().dictionary;
  var word = "Dalga";
  var meaning = await sozluk.meaning(word);

  var proverb = await sozluk.proverb(word);

  var audio = await sozluk.audioUrl(word);
  print("Meaning: $meaning");
  print("Proverb: $proverb");
  print("Audio: $audio");
}

void main() async {
  var sozluk = Sozluk().zemberek;
  var word = "Dalga";
  var morphemes = "Verb+Fut+Past+A3sg";

  var spelling_check = await sozluk.spellingCheck(word);

  var generate_word = await sozluk.generateWord(word, morphemes);

  var lemmas = await sozluk.lemmas(word);

  var spelling_suggestions = await sozluk.spellingSuggestions(word);

  print("Spelling Check: $spelling_check");
  print("Generate Word: $generate_word");
  print("Lemmas: $lemmas");
  print("Spelling Suggestions: $spelling_suggestions");
}

void zemberekBackend() async {
  var sozluk = Sozluk().zemberek;
  var word = "Dalga";
  var endpoint = 'spelling_check';
  var jsonBody = '{"word": "$word"}';

  var response = await sozluk.zemberekAPI(endpoint, jsonBody);
}
