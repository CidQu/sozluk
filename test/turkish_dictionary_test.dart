import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sozluk/sozluk.dart';

void main() {
  test('Deneme woooww', () async {
    var sozluk = Sozluk().zemberek;
    var tdk = Sozluk().dictionary;
    var word = "Dalga";
    var morphemes = "Verb+Fut+Past+A3sg";

    var meanings = await tdk.meaning(word);
    var proverbs = await tdk.proverb(word);
    var audio_url = await tdk.audioUrl(word);
    debugPrint("Meanings: $meanings");
    debugPrint("Proverbs: $proverbs");
    debugPrint("Audio URL: $audio_url");
  });
}
