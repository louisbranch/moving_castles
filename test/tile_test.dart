import 'package:unittest/unittest.dart';
import '../web/dart/tile.dart';

void main() {

  group('Tiles matrix:', () {
    List<Tile> matrix = Tile.build(1,1);
    test('has columns', () => expect(matrix.length, 1));
    test('has rows', () => expect(matrix[0].length, 1));
  });

  group('New Tile:', () {
    var tile = new Tile(2, 2);
    test('has coordinates', () => expect(tile.coordinates, '2:2'));
    test('has a default img', () => expect(tile.img, '/default_path.png'));
  });

  group('Tile layers:', () {
    var tile = new Tile(2, 2);
    var tile2 = new Tile(2, 2, img: '/another_path.png');
    tile.layer = tile2;

    test('sets a layer', () => expect(tile.layer, tile2));
    test('has a layer img', () => expect(tile.img, '/another_path.png'));

    test('removes a layer', () {
      tile.layer = null;
      expect(tile.layer, null);
    });

  });

}
