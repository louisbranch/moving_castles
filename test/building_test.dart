import 'package:unittest/unittest.dart';
import '../web/dart/building.dart';

void main() {

  group('New Building:', () {
    var building = new Building('Forge', []);

    test('has a name', () => expect('Forge', building.name));
    test('width size defaults to 2', () => expect(2, building.width));
    test('height size defaults to 2', () => expect(2, building.height));
    test('has list of layers', () => expect(building.layers.isEmpty, true));

  });

}


