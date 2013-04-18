library main;

import 'package:unittest/unittest.dart';
import 'building_test.dart' as building;
import 'castle_test.dart' as castle;
import 'hero_test.dart' as hero;
import 'layer_test.dart' as layer;
import 'tile_test.dart' as tile;
import 'lib/serializer_test.dart' as serializer;
import 'lib/2d_test.dart' as twod;

main() {
  group("bulding", building.main);
  group("castle", castle.main);
  group("hero", hero.main);
  group("layer", layer.main);
  group("tile", tile.main);
  group("serializer", serializer.main);
  group("2D", twod.main);
}
