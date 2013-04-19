import 'package:unittest/unittest.dart';
import '../../web/dart/lib/2d.dart' as twod;
import '../../web/dart/layer.dart';
import '../../web/dart/tile.dart';

void main() {

  group('grid list', () {
    int width = 3;
    int height = 2;
    var tile = new Tile(1,1);
    var tiles = [tile, tile, tile, tile, tile, tile];

    var layer = new Layer('bg', 'bg.png', tiles, width, height);
    var grid = twod.createGrid([layer, layer]);

    group('layer', () {
      var layer = grid.first;
      test('rows are equal to height', () => expect(layer.length, height));
      test('columns are equal to width', () => expect(layer[0].length, width));
      //test('columns have elements in order', () => expect(grid[1], [4,5,6]));
    });

  });
}
