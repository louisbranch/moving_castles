library main;

import 'package:unittest/unittest.dart';
import 'building_test.dart' as building;
import 'castle_test.dart' as castle;
import 'hero_test.dart' as hero;
import 'tile_test.dart' as tile;
import 'lib/serializer_test.dart' as serializer;

main() {
  group("bulding", building.main);
  group("castle", castle.main);
  group("hero", hero.main);
  group("tile", tile.main);
  group("serializer", serializer.main);
}
