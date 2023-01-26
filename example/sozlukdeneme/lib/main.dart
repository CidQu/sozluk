import 'package:flutter/material.dart';
import 'package:sozluk/sozluk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sözlük Kütüphane Örneği'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var string = 'Kelime Girin';
  var textfieldController = TextEditingController();
  var sozlukD = Sozluk().dictionary;
  var sozlukZ = Sozluk().zemberek;

  void _spellingCheck() async {
    var sonuc = await sozlukZ.spellingCheck(textfieldController.text);
    print(sonuc);
    setState(() {
      string = sonuc;
    });
  }

  void _spellingSuggestions() async {
    var sonuc = await sozlukZ.spellingSuggestions(textfieldController.text);
    print(sonuc);
    setState(() {
      string = sonuc[0];
    });
  }

  void _lemmas() async {
    var sonuc = await sozlukZ.lemmas(textfieldController.text);
    print(sonuc);
    setState(() {
      string = sonuc[0];
    });
  }

  void _meaning() async {
    var sonuc = await sozlukD.meaning(textfieldController.text);
    print(sonuc);
    setState(() {
      string = sonuc;
    });
  }

  void _proverb() async {
    var sonuc = await sozlukD.proverb(textfieldController.text);
    print(sonuc);
    setState(() {
      string = sonuc;
    });
  }

  void audioUrl() async {
    var sonuc = await sozlukD.audioUrl(textfieldController.text);
    print(sonuc);
    setState(() {
      string = sonuc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Yazı Girin',
                ),
                controller: textfieldController,
                onChanged: (value) {
                  string = value;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Kontrol Et'),
                  onPressed: _spellingCheck,
                ),
                ElevatedButton(
                  child: const Text('Eş Anlamlısı'),
                  onPressed: _spellingSuggestions,
                ),
                ElevatedButton(
                  child: const Text('Köküne Ayır'),
                  onPressed: _lemmas,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Anlamı'),
                  onPressed: _meaning,
                ),
                ElevatedButton(
                  child: const Text('Atasözü'),
                  onPressed: _proverb,
                ),
                ElevatedButton(
                  child: const Text('Ses'),
                  onPressed: audioUrl,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            if (string == 'true') ...[
              Text('Doğru!')
            ] else if (string == 'false') ...[
              Text('Yanlış!')
            ] else ...[
              Text(string)
            ]
          ],
        ),
      ),
    );
  }
}
