import 'package:unittest/unittest.dart';
import '../web/dart/building.dart';
import '../web/dart/castle.dart';

void main() {

  group('[mana source]', () {
    var castle, tile, building;

    setUp(() {
      castle = new Castle('Baldurs Gate', 3);
      tile = castle.tiles.first;
      building = new ManaSource();
    });

    group('[on]', () {
      setUp(() => building.on(castle));
      test('adds mana to castle', () => expect(castle.mana, 5));
    });

    group('[off]', () {
      setUp(() => building.off(castle));
      test('removes mana from castle', () => expect(castle.mana, -5));
    });

  });

}

