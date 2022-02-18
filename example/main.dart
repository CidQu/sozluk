import 'package:sozluk/sozluk.dart';

void main(List<String> args) {
  var sozluk = Sozluk();
  var word = "Dalga";

  var meaning = sozluk.meaning(word);

  var proverb = sozluk.proverb(word);

  var audio = sozluk.audioUrl(word);

  print("Meaning: $meaning");
  print("Proverb: $proverb");
  print("Audio: $audio");
}