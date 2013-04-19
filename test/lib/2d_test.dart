import 'package:unittest/unittest.dart';
import '../../web/dart/lib/2d.dart' as twod;
import '../../web/dart/layer.dart';
import '../../web/dart/tile.dart';

void main() {

  group('#createGrid', () {

    int width = 3;
    int height = 2;
    var tile1 = new Tile(1,1);
    var tile2 = new Tile(1,1);
    var tile3 = new Tile(1,1);
    var tiles = [tile1, tile1, tile1, tile1, tile2, tile3];

    var layer = new Layer('bg', 'bg.png', tiles, width, height);
    var grid = twod.createGrid([layer, layer]);

    test('generates a list of 2 dimensional layers', () => expect(grid.length, 2));

    group('layer', () {
      var layer = grid.first;
      test('has N rows equals to its height size', () => expect(layer.length, height));
      test('rows have N tiles equal to its width size', () => expect(layer[0].length, width));
      test('tiles are put in order inside the row', () => expect(layer[1], [tile1, tile2, tile3]));
    });

  });
}
