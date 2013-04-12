import 'package:unittest/unittest.dart';
import '../web/dart/building.dart';

void main() {

  group('New Building:', () {
    var building = new Building('Forge');

    test('has a name', () => expect('Forge', building.name));
    test('x size defaults to 2', () => expect(2, building.x));
    test('y size defaults to 2', () => expect(2, building.y));

  });

}


