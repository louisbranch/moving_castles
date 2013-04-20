import 'package:unittest/unittest.dart';
import '../../web/dart/lib/serializer.dart';
import '../../web/dart/castle.dart';
import '../../web/dart/tile.dart';
import '../fixtures.dart' as fixtures;

void main() {

  group('structure from json', () {
    var json = fixtures.castle_json;
    var castle = new Castle.fromJson(json);
    var tile = castle.tiles.first;

    test('creates a new castle', () => expect(castle is Castle, true));
    test('castle has a list of tiles', () => expect(tile is Tile, true));
  });

}
