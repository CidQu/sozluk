## Proje Sunumu
Proje sunumumuza ulaşmak için: [GoogleDrive](https://bit.ly/3z4ndI4)

## Kullanılan Veriler

Projemiz üzerinde kullanılan verilerin bir kısmı sozluk.gov.tr API'ı üzerinden çekilmiştir.

Örnek:
```
https://sozluk.gov.tr/gts?ara=yavuz
-
https://sozluk.gov.tr/yazim?ara=yavuz
-
https://sozluk.gov.tr/ses/y1400.wav
```

Diğer bir kısmı ise Zemberek Endpointleri kullanılarak yapılmıştır.

Endpointler: https://github.com/cbilgili/zemberek-nlp-server/blob/master/API.md

## Proje Öğrencileri

Yavuz Selimhan KAYA (Yazılımcı, Proje Lideri)

Defne Yıldırım (Sunum, Yazılım)

Melisa Bahadır (Sunum, Tasarım)

Tuana Yıldırım (Tasarım)

## Nasıl Kullanılır?

Öncelikle herhangi bir Flutter projesi oluşturmanız gerekiyor.

```bash
flutter create denemeProjesi
```

Daha sonrasında Projemize Sözlük kütüphanesini eklemek için aşağıdaki komutları uygulamamız gerekiyor.

```bash
cd denemeProjesi
```
```bash
flutter pub add sozluk
```

Artık projemizde Sözlük kütüphanesini kullanabiliriz. Kütüphanenin detaylı olarak neleri nasıl yaptığını öğrenmek için aşağıdaki README kısmına bakabilirsiniz.
Docs: [Anlatım](https://github.com/CidQu/sozluk/blob/main/READMETR.md)

## Genel Detaylar

Proje ikiye bölünmüştür. Çevrimiçi kısım ve Çevrimdışı kısım. Proje çevrimiçi kısmı ile, 0.255 saniyede çok hızlı bir şekilde POST request yaparak kullanılacak mobil uygulamanın telefonu yavaşlatmadan işlemleri hızlı bir şekilde yapması hedeflenmiştir.

Çevrimdışı kısmı ise herhangi bir internet bağlantısına ihtiyaç duymadan telefon üzerinde gerekli işlemleri halledecektir. Bu işlem biraz yavaş ve telefonu yormaktadır. Lakin herhangi bir internet bağlantısına ihtiyaç duymamaktadır.

Kütüphanemiz eğer ki sadece çevrimiçi kısmı kullanılırsa, 359 KB'dır.
Kütüphanemiz çevrimdışı modda kullanılırsa, 54 MB alan kaplar.

## Proje Amacı

Mobil uygulama geliştiriciliğinde sıklıkla tavsiye edilen Dart yazılım dili ve Flutter Framework'üdür. Flutter, Tübitak'ın ve Teknofest'in yaptığı eğitimler ile ülkemizde çokça kullanılmaktadır. Flutter tek tabanlı yazılımı; Android, iOS, Web, Pardus ve Windows'a kullanılabilecek bir biçimde yayınlanmaktadır. Flutter ve Dart, her yazılım dilinde olduğu gibi kütüphanelerden yararlanmaktadır. Bu verilerden yola çıkarak Flutter ve Dart tabanlı bir kütüphane takımımız tarafından geliştirilmiştir. 

Geliştirilen kütüphanede;

Kelimelerin anlamlarını bulma,
"Kelime düzgün yazılmış mı?",
"Cümleler anlamlı mı değil mi?",
"Noktalama hatalar var mı?" 

gibi bir çok fonksiyon bulunmaktadır. Bu kütüphaneyi diğerlerinden farklı yapan şey ise bu kütüphane direkt olarak tüm Flutter ile geliştirilen mobil uygulamalara entegre edilebilecek bir sistemdedir. Herhangi bir üçüncü parti sunucu vesaire yardımı olmadan cihaz üzerinde tüm bu sistemlerin kontrolü sağlanabilmektedir.
