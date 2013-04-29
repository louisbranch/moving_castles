import 'package:unittest/unittest.dart';
import '../web/dart/building.dart';
import '../web/dart/castle.dart';

void main() {

  group('[mana source]', () {

    var building = new ManaSource();

    group('[power on]', () {
      var castle = new Castle('Baldurs Gate', 3);
      var tile = castle.tiles.first;
      tile.powered = false;

      building.powerOn(castle, tile);

      test('powers tile built', () => expect(tile.powered, isTrue));
      test('powers all surrounding tiles', () {
        var surrounding = castle.surroundingTiles(tile);
        var allPowered = surrounding.every((t) => t.powered);
        expect(allPowered, isTrue);
      });
    });

    group('[power off]', () {
      var castle = new Castle('Baldurs Gate', 3);
      var tile = castle.tiles.first;

      building.powerOn(castle, tile);
      building.powerOff(castle, tile);

      test('unpowers tile built', () => expect(tile.powered, isFalse));
      test('unpowers all surrounding tiles', () {
        var surrounding = castle.surroundingTiles(tile);
        var nonePowered = surrounding.every((t) => !t.powered);
        expect(nonePowered, isTrue);
      });
    });

  });

}

