import 'package:flutter_test/flutter_test.dart';

import 'package:sozluk/sozluk.dart';

void main() {
  test('Deneme woooww', () async {
    final sozluk = Sozluk();
    var cevap = await sozluk.meaning('yavuz');
    print(cevap);
  });
}