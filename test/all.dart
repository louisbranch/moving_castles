library test;
import 'package:unittest/unittest.dart';
import 'castle_test.dart' as castle;
import 'tile_test.dart' as tile;
import 'building_test.dart' as building;

void main () {
  group('[castle]', () => castle.main());
  group('[tile]', () => tile.main());
  group('[building]', () => building.main());
}
