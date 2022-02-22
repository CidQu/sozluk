## Features
You can use this package to find meanings, proverb and voiceUrl of Turkish Words.
Or you can simply just get everything in JSON format, that is an option too.

All of our informations comes from official *Turkish Language Association*. You can find legal rights below.
Click this link for Turkish Readme: [Türkçe Sözlük](https://github.com/CidQu/sozluk/blob/main/READMETR.md)
## Usage

First you need to add sozluk package to your dart file.
```dart
import 'package:sozluk/sozluk.dart';
```

Then, you need to declare Sozluk in your class.
```dart
final sozluk = Sozluk();

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
## Contributors
This project is fully open source. You can find this project on [CidQu/sozluk](https://github.com/CidQu/sozluk). If you would like to expend this project you can fork or request a new pull request.

## Additional information

This project built with sozluk.gov.tr API. There is no legal restriction of using API. 
For any additional information you can contact me through mail. yavuz@cidqu.net