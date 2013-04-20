import 'package:unittest/unittest.dart';
import '../../web/dart/lib/serializer.dart';
import '../../web/dart/castle.dart';
import '../../web/dart/tile.dart';
import '../fixtures.dart' as fixtures;

void main() {

  group('structure from json', () {
    var json = fixtures.castle_json;
    var castle = new Castle.fromJson(json);

    test('creates a new castle', () => expect(castle is Castle, true));
    test('maps castle 2d tiles list to rows', () => expect(castle.tiles is List, true));
    test('and columns', () => expect(castle.tiles.first is List, true));
    test('each columns has tiles', () => expect(castle.tiles.first.first is Tile, true));
  });

}
