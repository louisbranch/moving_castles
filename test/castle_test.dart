import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';
import 'fixtures.dart' as fixtures;

void main() {

  group('[new castle]', () {

    var castle = new Castle('Baldurs Gate', 2, 2, 'castle.png');

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));
    test('has a empty map of tiles', () => expect(castle.map.length, 4));

  });

  group('[castle from json]', () {

    String json = fixtures.castle;
    var castle = new Castle.fromJson(json);

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));
    test('has a map of tiles', () => expect(castle.map.keys.first is Tile, isTrue));

  });

  group('[castle map]', () {
    var castle = new Castle('Baldurs Gate', 0, 0, 'castle.png');
    var tile = new Tile(0, 0);
    var building = new Building('Forge');
    castle.map[tile] = building;

    test('has a list of tiles', () => expect(castle.tiles, contains(tile)));
    test('has a list of buildings', () => expect(castle.buildings, contains(building)));
  });

}
