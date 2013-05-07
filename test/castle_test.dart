import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import '../web/dart/castle.dart';
import '../web/dart/event.dart';
import '../web/dart/building.dart';
import 'fixtures.dart' as fixtures;

class MockBuilding extends Mock implements Building {
  int manaRequired = 0;
}

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
    var building = new MockBuilding();
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
    var tile = castle.findTile(1,1);

    test('returns 4 surrounding tiles', () => expect(castle.surroundingTiles(tile), hasLength(4)));
    test('does not return the central title', () => expect(castle.surroundingTiles(tile), isNot(contains(tile))));

    group('when tile does not have 4 surrounding tiles', () {

      Tile tile = castle.findTile(0,0);
      test('return availables', () => expect(castle.surroundingTiles(tile), hasLength(2)));

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

  group('[valid placement]', () {

    var castle, building, tile, result;

    setUp(() {
      castle = new Castle('Baldurs Gate', 0);
      building = new MockBuilding();
      tile = new Tile(0, 0);
    });

    group('[when everything is valid]', () {

      setUp(() {
        castle.map[tile] = null;
        var next_tile = new Tile(1, 0);
        castle.map[next_tile] = building;
        result = castle.validPlacement(building, tile);
      });

      test('errors is empty', () => expect(castle.errors, isEmpty));
      test('returns true', () => expect(result, isTrue));
    });

    group('[when tile has a building]', () {

      setUp(() {
        castle.map[tile] = building;
        result = castle.validPlacement(building, tile);
      });

      test('errors has message', () => expect(castle.errors, contains('Tile already has a building')));
      test('returns false', () => expect(result, isFalse));
    });

    group('[when tile is not next to another building]', () {

      group('[when is the first tile]', () {
        setUp(() => result = castle.validPlacement(building, tile));
        test('errors is empty', () => expect(castle.errors, isEmpty));
        test('returns true', () => expect(result, isTrue));
      });

      group('[when is not the first tile]', () {

        setUp(() {
          var next_tile = new Tile(2, 2);
          castle.map[next_tile] = building;
          result = castle.validPlacement(building, tile);
        });

        test('errors has message', () => expect(castle.errors,
            contains('Building needs to be next to another building')));
        test('returns false', () => expect(result, isFalse));

      });

    });

  });

  group('[has building next]', () {
    var castle, tile, other_tile, building;

    setUp(() {
      castle = new Castle('Baldurs Gate', 3);
      tile = castle.findTile(0,0);
      building = new MockBuilding();
    });

    group('[when a surrounding tile has a building', () {

      setUp(() {
        other_tile = castle.findTile(0,1);
        castle.map[other_tile] = building;
      });

      test('returns true', () => expect(castle.hasBuildingNext(tile), isTrue));

    });

    group('[when a surrounding tile does not have a building', () {
      test('returns false', () => expect(castle.hasBuildingNext(tile), isFalse));
    });

  });


  group('[receiving message]', () {
    var castle;
    setUp(() => castle = new Castle('Baldurs Gate', 0));

    group('[changing mana]', () {
      setUp(() => new Event(castle.pid, {'type' : 'mana:change', 'mana' : -5}));
      test('modifies castle mana', () => expect(castle.mana, -5));
    });

    group('[building build]', () {
      var building, tile;
      setUp(() {
        building = new MockBuilding();
        tile = new Tile(0, 0);
        new Event(castle.pid, {'type': 'building:build', 'building': building, 'tile': tile});
      });
      test('assigns building to tile', () => expect(castle.map[tile], building));
    });

  });

}
