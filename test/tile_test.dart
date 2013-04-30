import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';

void main() {
  var tile = new Tile(0,1);

  group('[new]', () {
    test('has x coordinates', () => expect(tile.x, 0));
    test('has y coordinates', () => expect(tile.y, 1));
  });

  group('[powered]', () {
    tile.powered = true;
    test('can be powered', () => expect(tile.powered, isTrue));
  });

  group('[to string]', () {
    test('returns its coordinates representation', () => expect(tile.toString(), '0:1'));
  });

  group('[from map]', () {
    var tile = new Tile.fromMap({'x': 0, 'y': 0});
    test('creates a tile from a map representation', () => expect(tile is Tile, isTrue));
  });

}
