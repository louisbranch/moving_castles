import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';
import 'fixtures.dart' as fixtures;

void main() {

  group('[new castle]', () {

    var castle = new Castle('Baldurs Gate', 2, 'castle.png');

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));
    test('has a empty map of tiles equals to size ** 2', () => expect(castle.map, hasLength(4)));

  });

  group('[castle from json]', () {

    String json = fixtures.castle;
    var castle = new Castle.fromJson(json);

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));
    test('has a map of tiles', () => expect(castle.map.keys.first is Tile, isTrue));

  });

  group('[castle map]', () {

    var castle = new Castle('Baldurs Gate', 0);
    var tile = new Tile(0, 0);
    var building = new Building('Forge');
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

    int size = 3;
    var castle = new Castle('Baldurs Gate', size);

    test('generates a list equals to its size', () => expect(castle.grid, hasLength(size)));
    test('each sublist has sorted tiles', () => expect(castle.grid.first, castle.tiles.sublist(0,size)));

  });

}
