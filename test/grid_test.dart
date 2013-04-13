import 'package:unittest/unittest.dart';
import '../web/dart/grid.dart';

void main() {

  group('Grid:', () {

    group('2D list', () {
      int width = 3;
      int height = 2;
      List layers = [1,2,3,4,5,6];

      var grid = new Grid();
      grid.create2dList(layers, width, height);

      test('rows == height', () => expect(grid.layers.length, height));
      test('columns == width', () => expect(grid.layers[0].length, width));
      test('columns have elements in order', () => expect(grid.layers[1], [4,5,6]));

    });

  });

}
