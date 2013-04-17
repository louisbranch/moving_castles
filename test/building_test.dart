import 'package:unittest/unittest.dart';
import '../web/dart/building.dart';

void main() {

  group('New Building:', () {
    var building = new Building('Forge', [], 2, 2);

    test('has a name', () => expect('Forge', building.name));
    test('has a width size', () => expect(2, building.width));
    test('has a height size', () => expect(2, building.height));
    test('has list of layers', () => expect(building.layers.isEmpty, true));

  });

}


