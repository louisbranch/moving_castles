import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import '../web/dart/castle.dart';
import '../web/dart/building.dart';
import 'fixtures.dart' as fixtures;

class MockBuilding extends Mock implements Building {}

void main() {

  group('[new]', () {

    var castle = new Castle('Baldurs Gate', 2, 'castle.png');

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));
    test('has a empty map of tiles equals to size ** 2', () => expect(castle.map, hasLength(4)));

  });

  group('[from json]', () {

    String json = fixtures.castle;
    var castle = new Castle.fromJson(json);

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));
    test('has a map of tiles', () => expect(castle.map.keys.first is Tile, isTrue));

  });

  group('[map]', () {

    var castle = new Castle('Baldurs Gate', 0);
    var tile = new Tile(0, 0);
    var building = new ManaSource();
    castle.map[tile] = building;

    test('has a list of tiles', () => expect(castle.tiles, contains(tile)));
    test('has a list of buildings', () => expect(castle.buildings, contains(building)));

  });

  group('[find tiles]', () {

    var castle = new Castle('Baldurs Gate', 0);
    var tile = new Tile(0, 0);
    castle.map[tile] = null;

    test('returns the tile with the x, y coordinates', () => expect(castle.findTile(0,0), tile));
    test('or else returns null', () => expect(castle.findTile(1,0), isNull));

  });

  group('[surrounding tiles]', () {

    var castle = new Castle('Baldurs Gate', 3);
    Tile tile = castle.findTile(1,1);

    test('returns 8 surrounding tiles', () => expect(castle.surroundingTiles(tile), hasLength(8)));
    test('does not return the central title', () => expect(castle.surroundingTiles(tile), isNot(contains(tile))));

    group('when tile does not have 8 surrounding tiles', () {

      Tile tile = castle.findTile(0,0);
      test('return availables', () => expect(castle.surroundingTiles(tile), hasLength(3)));

    });

  });

  group('[tiles grid]', () {

    int size = 2;
    var castle = new Castle('Baldurs Gate', size);
    Tile tile1 = castle.findTile(0,0);
    Tile tile2 = castle.findTile(0,1);

    test('generates a list equals to its size', () => expect(castle.grid, hasLength(size)));

    test('each sublist has sorted tiles as a map {"tile": <Tile>, "building": <Building>}', () {
      expect(castle.grid.first, [
        {'tile': tile1, 'building': null},
        {'tile': tile2, 'building': null}
      ]);
    });

  });

  group('[building]', () {

    group('[when tile is empty and powered]', () {
      var castle = new Castle('Baldurs Gate', 0);
      var building = new MockBuilding();
      var tile = new Tile(0, 0);
      tile.powered = true;
      castle.map[tile] = null;
      bool result = castle.build(building, tile);

      test('errors is empty', () => expect(castle.errors, isEmpty));
      test('assigns building to tile', () => expect(castle.map[tile], building));
      test('building call powerOn with castle and tile', () {
        building.getLogs(callsTo('powerOn', castle, tile)).verify(happenedOnce);
      });
      test('returns true', () => expect(result, isTrue));
    });

    group('[when tile has a building]', () {
      var castle = new Castle('Baldurs Gate', 0);
      var building = new ManaSource();
      var tile = new Tile(0, 0);
      castle.map[tile] = building;
      bool result = castle.build(building, tile);

      test('errors has message', () => expect(castle.errors, contains('Tile already has a building')));
      test('returns false', () => expect(result, isFalse));
    });

    group('[when tile is not powered]', () {
      var castle = new Castle('Baldurs Gate', 0);
      var building = new ManaSource();
      var tile = new Tile(0, 0);
      tile.powered = false;
      bool result = castle.build(building, tile);

      test('errors has message', () => expect(castle.errors, contains('Not mana powered')));
      test('returns false', () => expect(result, isFalse));
    });

  });

}
