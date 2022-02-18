import 'package:sozluk/sozluk.dart';

void main() async {
  var sozluk = Sozluk();
  var word = "Dalga";

  var meaning = await sozluk.meaning(word);

  var proverb = await sozluk.proverb(word);

  var audio = await sozluk.audioUrl(word);

  print("Meaning: $meaning");
  print("Proverb: $proverb");
  print("Audio: $audio");
}
