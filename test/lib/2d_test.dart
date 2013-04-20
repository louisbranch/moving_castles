import 'package:unittest/unittest.dart';
import '../../web/dart/lib/2d.dart' as twod;
import '../../web/dart/castle.dart';
import '../../web/dart/tile.dart';

void main() {

  group('#createGrid', () {

    int width = 3;
    int height = 2;
    var tile1 = new Tile(1,1);
    var tile2 = new Tile(1,1);
    var tile3 = new Tile(1,1);
    var tiles = [tile1, tile1, tile1, tile1, tile2, tile3];

    var castle = new Castle('Baldurs Gate', tiles, 3, 2);

    var grid = twod.createGrid(castle);

    test('generates a list of 2 dimensional tile', () => expect(grid.length, 2));

    group('tile', () {
      test('has N rows equals to its height size', () => expect(grid.length, height));
      test('rows have N tiles equal to its width size', () => expect(grid[0].length, width));
      test('tiles are put in order inside the row', () => expect(grid[1], [tile1, tile2, tile3]));
    });

  });
}
