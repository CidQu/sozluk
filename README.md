Click this link for Turkish Readme: [Türkçe Sözlük](https://github.com/CidQu/sozluk/blob/main/READMETR.md)

Açıkhack Sunumu: [ACIKHACK](https://github.com/CidQu/sozluk/blob/main/ACIKHACK.md)

Package Link: https://pub.dev/packages/sozluk

## Teknofest
This project built for Teknofest (Açıkhack) NPL tournament.

To access our presentation: [GoogleDriveTR](https://bit.ly/3z4ndI4)
#acikhack2022tddi #Acıkhack2022TDDİ

## Features
You can use this package to find meanings, proverb and voiceUrl of Turkish Words. Or you can check spellings, generate new words, find lemmas and so much more!

All of our informations comes from official *Turkish Language Association* and Zemberek. You can find legal rights below.
## Usage

First you need to add sozluk package to your dart file.
```dart
import 'package:sozluk/sozluk.dart';
```
## NEW UPDATE!
With this new update, you can use Zemberek API's with this package!

You can check spellings, generate new words, find lemmas and so much more! Check out API Page for more!
https://pub.dev/documentation/sozluk/latest/

Now this package has two way of usage.
1. Dictionary: You can find meanings, audio urls and proverbs of a single word.
2. Zemberek: You can check spellings, generate words, find lemmas. Basicly a NLP works with Flutter.

## 1. Dictionary
If you want to use Dictionary you need to declare it.
```dart
final sozluk = Sozluk().dictionary;

final word = 'Dalga'; // You can only use this with Turkish Words.
```

If you want to find meaning you can simply use meaning() function. You need to provide a String. You will get String as a response.
```dart
var answer = await sozluk.meaning(word);
```

If you want to find proverb you can simply use proverb() function. You need to provide a String. You will get String as a response.
```dart
var answer = await sozluk.proverb(word);
```

If you want to find Audio URL's you can simply use audioUrl() function. You need to provide a String. You will get String as a response. Besides other ones, you need to provide the whole word that has been registered in the Turkish Language Association. If you give 'Dalga' as a string you will get an audio url. But if you use 'Dalg' (which is not a formal Turkish word.) you will get an error. 
```dart
var answer = await sozluk.audioUrl(word);
```

If you want to get whole json example you can use getJson() function. You need to provide a String. Then you will get String as a response. You can use dart convert to convert String to Map.
```dart
var answer = await sozluk.getJson(word);
```

## 2. Zemberek

If you want to use Zemberek you need to declare it.
```dart
final sozluk = Sozluk().zemberek;

final word = 'Dalga'; // You can only use this with Turkish Words.
```

If you want to check spellings of a sentences or a word you can simply use spellingCheck() function. You need to provide a String. You will get String as a response.
```dart
var answer = await sozluk.spellingCheck(word);
```

If you want to generate words with sample you can simply use generateWord() function. You need to provide a Sample and a Morphemes. You will get String as a response.
```dart
var answer = await sozluk.generateWord(word, morphemes);
```

If you want to get lammas of a word you can simply use lemmas() function. You need to provide a String. You will get String as a response.
```dart
var answer = await sozluk.lemmas(word);
```

If you want to get access to whole backend you can use zemberekAPI() function. You need to provide a endpoint and body. Then you will get String as a response. You can use dart convert to convert String to Map.
```dart
var answer = await sozluk.zemberekAPI(endpoint, body);
```

## Contributors
This project is fully open source. You can find this project on [CidQu/sozluk](https://github.com/CidQu/sozluk). If you would like to expend this project you can fork or request a new pull request.

## Additional information

This project built with sozluk.gov.tr API. There is no legal restriction of using API. 
For any additional information you can contact me through mail. yavuz@cidqu.net
