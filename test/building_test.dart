import 'package:unittest/unittest.dart';
import '../web/dart/building.dart';
import '../web/dart/tile.dart';

void main() {

  group('New Building', () {
    var building = new Building(name: 'Forge');

    test('has a name', () => expect('Forge', building.name));
    test('x size defaults to 2', () => expect(2, building.x));
    test('y size defaults to 2', () => expect(2, building.y));

  });

  group('Building Tiles', () {
    var building = new Building(x: 1, y: 1);
    test('builds tiles matrix', () {
      expect(building.tiles[0][0], new isInstanceOf<Tile>());
    });
  });

}


