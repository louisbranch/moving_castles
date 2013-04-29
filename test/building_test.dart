import 'package:unittest/unittest.dart';
import '../web/dart/building.dart';
import '../web/dart/castle.dart';

void main() {

  group('[mana source]', () {

    var building = new ManaSource();
    var castle = new Castle('Baldurs Gate', 3);
    var tile = castle.tiles.first;
    tile.powered = false;

    group('[power on]', () {

      building.powerOn(castle, tile);

      test('powers tile built', () => expect(tile.powered, isTrue));
      test('powers all surrounding tiles', () {
        var surrounding = castle.surroundingTiles(tile);
        var allPowered = surrounding.every((t) => t.powered);
        expect(allPowered, isTrue);
      });
    });

  });

}

