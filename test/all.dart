library test;
import 'package:unittest/unittest.dart';
import 'castle_test.dart' as castle;
import 'tile_test.dart' as tile;

void main () {
  group('[castle]', () => castle.main());
  group('[tile]', () => tile.main());
}
