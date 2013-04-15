import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';

void main() {

  group('New Castle:', () {
    var castle = new Castle('Baldurs Gate', []);

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('width size defaults to 5', () => expect(castle.width, 5));
    test('height size defaults to 5', () => expect(castle.height, 5));
    test('has list of layers', () => expect(castle.layers.isEmpty, true));

  });

  group('Castle from Json:', () {
    String json = '''
      {
        "name" : "Baldurs Gate",
        "layers" : [],
        "height": 0,
        "width": 0
      }
    ''';

    test('parse json string into new castle', () {
      var castle = new Castle.fromJSON(json);
      expect(castle.name, 'Baldurs Gate');
    });

  });

}
