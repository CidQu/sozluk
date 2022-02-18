## Features
You can use this package to find meanings, proverb and voiceUrl of Turkish Words.
Or you can simply just get everything in JSON format, that is an option too.

All of our informations comes from official *Turkish Language Society*. You can find legal rights below.
## Usage

First you need to declare Sozluk in your class.
```dart
final sozluk = Sozluk();

final word = 'Dalga'; //Ofcourse, you can only use this with Turkish Words.
```

If you want to find meaning you can simply use:
```dart
var answer = await sozluk.meaning(word);
```

If you want to find proverb you can simply use:
```dart
var answer = await sozluk.proverb(word);
```

If you want to find voiceUrl you can simply use:
```dart
var answer = await sozluk.audioUrl(word);
```

If you want to get whole json example you can use:
```dart
var answer = await sozluk.getJson(word);
```

There is Turkish Version of this package, you can use it like this:
```dart
final sozluk = SozlukTr();
sozluk.anlam(word);
sozluk.atasozu(word);
sozluk.sesUrl(word);
sozluk.getJson(word);
```

## Additional information

This project built with sozluk.gov.tr API. There is no legal restriction of using API. 
For any additional information you can contact me through mail. yavuz@cidqu.net