import 'package:unittest/unittest.dart';
import '../web/dart/layer.dart';
import '../web/dart/tile.dart';

makeTiles(n) {
  List tiles = [];
  while (tiles.length < n) { tiles.add(new Tile(0,0)); }
  return tiles;
}

void main() {

  group('New Layer:', () {
    var layer = new Layer('Floor', '/floor.png', makeTiles(2), 2, 1);

    test('has a name', () => expect(layer.name, 'Floor'));
    test('has a tile set path', () => expect(layer.tileset, '/floor.png'));
    test('has a list of tiles', () => expect(layer.tiles.length, 2));
    test('has width', () => expect(layer.width, 2));
    test('has height', () => expect(layer.height, 1));

  });

  group('Layer tiles:', () {
    newLayer(n) => new Layer('Floor', '/floor.png', makeTiles(n), 3, 3);

    test('throws if tiles < width * height', () => expect(() => newLayer(8), throws));
    test('throws if tiles > width * height', () => expect(() => newLayer(10), throws));
    test('passes if tiles == width * height', () => expect(() => newLayer(9), returnsNormally));
  });

}

