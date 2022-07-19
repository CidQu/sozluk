import 'package:flutter_test/flutter_test.dart';

import 'package:sozluk/sozluk.dart';

void main() {
  test('Deneme woooww', () async {
    final sozluk = Sozluk().zemberek;
    var cevap = await sozluk.spellingCheck('Dalga');
    print(cevap);
  });
}
