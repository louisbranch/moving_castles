library building_test;
import 'package:unittest/unittest.dart';
import '../web/dart/building.dart';
import '../web/dart/tile.dart';

void main() {

  group('#new', () {
    var building = new Building('Forge');
    var tile = new Tile();
    building.tile = tile;

    test('has a name', () => expect('Forge', building.name));
    test('has a tile', () => expect(building.tile, tile));
  });

}
