## Sozluk
Flutter, TDK Paketi. Bu paketi kullanarak kolayca kelimelerin anlamlarını, atasözlerini ve ses dosyalarını bulabilirsin veya direk JSON halinde alabilirsiniz. Bu paket sozluk.gov.tr api'leri kullanılarak yapılmıştır.
Tüm bilgiler direkt olarak Türk Dil Kurumundan gelmektedir. Yasal uyarı için aşağıda bulunan ek bilgiler kısmını okuyunuz.

Click this link for Main Readme: [Main README File](https://github.com/CidQu/sozluk/blob/main/README.md)

## Kullanımı

Öncelikle Sozluk paketini .dart uzantılı dosyanıza eklemeniz gerekmektedir.
```dart
import 'package:sozluk/sozluk.dart';
```

Daha sonrasında ise SozlukTr sınıfını herhangi bir değişkene atamanız gerekmektedir. Sozluk sınıfı sadece tek bir 'String' kabul eder ve geriye tek bir 'String' verir.
```dart
final sozluk = SozlukTr();

final word = 'Dalga';
```

Herhangi bir kelimenin anlamını bulmak için anlam() fonksiyonunu kullanabilirsiniz. Bu fonksiyon size, gönderdiğiniz kelime ile bağdaşan en iyi açıklamayı verecektir. String olarak kelime verip, String olarak kelime alırsınız.
```dart
var answer = await sozluk.anlam(word);
```

Herhangi bir kelimenin atasözünü bulmak için atasozu() fonksiyonunu kullanabilirsiniz. Bu fonksiyon size, gönderdiğiniz kelime ile bağdaşan en iyi atasözünü verecektir. Anlam fonksiyonunda olduğu gibi String olarak kelime verip, String olarak kelime alırsınız.
```dart
var answer = await sozluk.atasozu(word);
```

Herhangi bir kelimenin telafüz ses dosyasını bulmak için sesUrl() fonksiyonunu kullanabilirsiniz. Bu fonksiyon size, gönderdiğiniz kelime'nin Türkçe nasıl telafüz edildiğine dair ses dosyası gönderir. String olarak kelime verip, String olarak url alırsınız. Diğer fonksiyonlardan farklı olarak, bu fonksiyona sadece TDK'da kayıtlı olan kelimeleri gönderebilirsiniz. 'Dalga' kelimesini gönderirseniz bir url karşılığı alırsınız lakin 'Dalg' olarak gönderirseniz hata verecektir veya başka bir ses dosyasını verecektir. Ses dosyası bulma TDK'nın api sisteminde yoktur. Bu sistem url değiştirerek elde edilmiştir, GitHub üzerinden bakabilirsiniz.
```dart
var answer = await sozluk.audioUrl(word);
```

Eğer yukarıdakilerden farklı olarak tüm JSON dosyasını almak isterseniz getJson() fonksiyonunu kullanabilirsiniz. Bu json dosyası TDK apileri desteklemediği için ses url'si içermemektedir.
```dart
var answer = await sozluk.getJson(word);
```
## Yardım
Bu proje tamamen açık kaynak kodludur. Projeyi gitmek için: [CidQu/sozluk](https://github.com/CidQu/sozluk) Herhangi bir yardımda bulunmak isterseniz GitHub üzerinden isterseniz forklayarak isterseniz de pull ederek yardımda bulunabilirsiniz.


## Ek Bilgiler

Bu proje Türk Dil Kurumu çatısı altında olan sozluk.gov.tr API'si kullanılarak yapılmıştır. Herhangi bir yasal işlem veya iletişim için eposta yoluyla iletişime geçebilirsiniz. Umarım ileride Türk Dil Kurumu gibi diğer kurumlar da API kullanımını yaygınlaştırır. Eposta: yavuz@cidqu.net