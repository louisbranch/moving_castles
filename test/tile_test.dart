import 'package:unittest/unittest.dart';
import '../web/dart/tile.dart';

void main() {

  test('builds tiles matrix', () {
    expect(Tile.build(1,1)[0][0], new isInstanceOf<Tile>());
  });

  group('New Tile', () {
    var tile = new Tile(x: 2, y: 2);
    test('has coordinates', () => expect(tile.coordinates, '2:2'));
    test('has a default img', () => expect(tile.img, '/default_path.png'));
  });

  group('Tile layers', () {
    var tile1 = new Tile(x: 2, y: 2);
    var tile2 = new Tile(x: 2, y: 2, img: '/another_path.png');
    tile1.layer = tile2;

    test('setting a layer', () => expect(tile1.layer, tile2));
    test('loads layer img', () => expect(tile1.img, '/another_path.png'));

    test('removing a layer', () {
      tile1.layer = null;
      expect(tile1.layer, null);
    });

  });

}
