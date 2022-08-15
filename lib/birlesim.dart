import 'scr/API/dictionary.dart' as d;
import 'scr/API/zemberek.dart' as z;
import 'scr/Docker/kurulum.dart' as doc;
import 'scr/LocalCalls/zemberek.dart' as zOff;

class Sozluk {
  var dictionary = d.Sozluk();
  var zemberek = z.Sozluk();
}

class SozlukOffline {
  var controller = doc.Setup();
  var zemberek = zOff.SozlukOffline();
}

// Hey!! It's me. Again. Pffft. I'm CidQu btw.