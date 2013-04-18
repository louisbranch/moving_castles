import 'package:unittest/unittest.dart';
import '../../web/dart/lib/2d.dart' as twod;

void main() {

  group('grid list', () {
    int width = 3;
    int height = 2;
    List layers = [1,2,3,4,5,6];

    var list = twod.createGrid(layers, width, height);

    test('rows are equal to height', () => expect(list.length, height));
    test('columns are equal to width', () => expect(list[0].length, width));
    test('columns have elements in order', () => expect(list[1], [4,5,6]));

  });

}
