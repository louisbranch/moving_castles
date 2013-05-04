library test;
import 'package:unittest/unittest.dart';
import 'package:unittest/compact_vm_config.dart';
import 'castle_test.dart' as castle;
import 'tile_test.dart' as tile;
import 'building_test.dart' as building;

void main () {
  useCompactVMConfiguration();
  group('[castle]', () => castle.main());
  group('[tile]', () => tile.main());
  group('[building]', () => building.main());
}
