Kütüphane Bağlantısı: [pub.dev](https://pub.dev/packages/sozluk)

## Teknofest
Bu proje Teknofest Doğal Dil İşleme yarışması kapsamında hazırlanmıştır.
Proje sunumumuza ulaşmak için: [GoogleDrive](https://bit.ly/3z4ndI4)

#acikhack2022tddi

## Sozluk
Flutter, TDK Paketi. Bu paketi kullanarak kolayca kelimelerin anlamlarını, atasözlerini, ses dosyalarını bulabilir aynı zamanda da cümle içi kullanımı doğru mu? Alternatif hangi kelimeler kullanılabilir? Gibi bir çok soruya yanıt alabilirsiniz. Bu paket sozluk.gov.tr ve zemberek api'leri kullanılarak yapılmıştır.
Tüm bilgiler direkt olarak Türk Dil Kurumundan ve Zemberek'ten gelmektedir. Yasal uyarı için aşağıda bulunan ek bilgiler kısmını okuyunuz.

Click this link for Main Readme: [Main README File](https://github.com/CidQu/sozluk/blob/main/README.md)

## Kullanımı

Öncelikle Sozluk paketini .dart uzantılı dosyanıza eklemeniz gerekmektedir.
```dart
import 'package:sozluk/sozluk.dart';
```
## YENİ GÜNCELLEME!
Bu yeni güncelleme ile birlikte Zemberek API'lerini de bu kütüphane ile kullanabileceksiniz!

Cümleler doğru mu yanlış mı kontrol edebilir, yeni benzer kelimeler oluşturabilir, kelimeyi köklerine ayırabilirsiniz. Detaylı bilgi için aşağıdaki API kullanım linkine gidin.
https://pub.dev/documentation/sozluk/latest/

Artık bu paketin iki farklı kullanımı var:
1. Sözlük: Kelimelerin anlamlarını, benzer atasözlerini veya Ses Dosyalarını bulabilirsiniz.
2. Zemberek: Cümleler doğru mu yanlış mı kontrol edebilir, yeni benzer kelimeler oluşturabilir, kelimeyi köklerine ayırabilirsiniz.

## 1. Sözlük

Sozluk sınıfını herhangi bir değişkene atamanız gerekmektedir. Sozluk sınıfı sadece tek bir 'String' kabul eder ve geriye tek bir 'String' verir.
```dart
final sozluk = Sozluk().dictionary;
final word = 'Dalga';
```

Herhangi bir kelimenin anlamını bulmak için anlam() fonksiyonunu kullanabilirsiniz. Bu fonksiyon size, gönderdiğiniz kelime ile bağdaşan en iyi açıklamayı verecektir. String olarak kelime verip, String olarak kelime alırsınız.
```dart
var answer = await sozluk.meaning(word);
```

Herhangi bir kelimenin atasözünü bulmak için atasozu() fonksiyonunu kullanabilirsiniz. Bu fonksiyon size, gönderdiğiniz kelime ile bağdaşan en iyi atasözünü verecektir. Anlam fonksiyonunda olduğu gibi String olarak kelime verip, String olarak kelime alırsınız.
```dart
var answer = await sozluk.proverb(word);
```

Herhangi bir kelimenin telafüz ses dosyasını bulmak için sesUrl() fonksiyonunu kullanabilirsiniz. Bu fonksiyon size, gönderdiğiniz kelime'nin Türkçe nasıl telafüz edildiğine dair ses dosyası gönderir. String olarak kelime verip, String olarak url alırsınız. Diğer fonksiyonlardan farklı olarak, bu fonksiyona sadece TDK'da kayıtlı olan kelimeleri gönderebilirsiniz. 'Dalga' kelimesini gönderirseniz bir url karşılığı alırsınız lakin 'Dalg' olarak gönderirseniz hata verecektir veya başka bir ses dosyasını verecektir. Ses dosyası bulma TDK'nın api sisteminde yoktur. Bu sistem url değiştirerek elde edilmiştir, GitHub üzerinden bakabilirsiniz.
```dart
var answer = await sozluk.audioUrl(word);
```

Eğer yukarıdakilerden farklı olarak tüm JSON dosyasını almak isterseniz getJson() fonksiyonunu kullanabilirsiniz. Bu json dosyası TDK apileri desteklemediği için ses url'si içermemektedir.
```dart
var answer = await sozluk.getJson(word);
```

## 2. Zemberek

Zemberek'i kullanmak için öncelikle bir değere atamamız gerekiyor.
```dart
final sozluk = Sozluk().zemberek;
final word = 'Dalga';
```

Bir cümlenin veya kelimenin yazımını kontrol etmek istiyorsanız, yalnızca spellingCheck() fonksiyonunu kullanabilirsiniz. Bir String verirsiniz. Yanıt olarak String alırsınız.
```dart
var answer = await sozluk.spellingCheck(word);
```

Eğer örnekle kelimeler üretmek istiyorsanız, sadece generateWord() fonksiyonunu kullanabilirsiniz. Bir Örnek Kelime ve Metafor verirsiniz. Yanıt olarak String alırsınız.
```dart
var answer = await sozluk.generateWord(word, morphemes);
```

Bir kelimeyi köklerine ayırmak istiyorsanız, basitçe lemmas() fonksiyonunu kullanabilirsiniz. Bir String verirsiniz. Yanıt olarak String alırsınız.
```dart
var answer = await sozluk.lemmas(word);
```

Tüm backend'e erişmek istiyorsanız zemberekAPI() fonksiyonunu kullanabilirsiniz. Bir endpoint ve bir body("Json.toString()") sağlamanız gerekir. Sonra yanıt olarak bir String alacaksınız. String'i Map'e dönüştürmek için dart:convert'i kullanabilirsiniz.
```dart
var answer = await sozluk.zemberekAPI(endpoint, body);
```

## Yardım
Bu proje tamamen açık kaynak kodludur. Projeyi gitmek için: [CidQu/sozluk](https://github.com/CidQu/sozluk) Herhangi bir yardımda bulunmak isterseniz GitHub üzerinden isterseniz forklayarak isterseniz de pull ederek yardımda bulunabilirsiniz.


## Ek Bilgiler

Bu proje Türk Dil Kurumu çatısı altında olan sozluk.gov.tr API'si kullanılarak yapılmıştır. Herhangi bir yasal işlem veya iletişim için eposta yoluyla iletişime geçebilirsiniz. Umarım ileride Türk Dil Kurumu gibi diğer kurumlar da API kullanımını yaygınlaştırır. Eposta: yavuz@cidqu.net
