import 'package:flutter_test/flutter_test.dart';

import 'package:sozluk/sozluk.dart';

void main() {
  test('Deneme woooww', () async {
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
  });
}
