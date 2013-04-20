import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';
import '../web/dart/tile.dart';

void main() {

  group('#new', () {
    var tile = new Tile(1,1);
    newCastle(width, height) => new Castle('Baldurs Gate', [tile, tile], width, height, 'castle.png');

    var castle = newCastle(1,2);

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has width size', () => expect(castle.width, 1));
    test('has height size', () => expect(castle.height, 2));
    test('has list of tiles', () => expect(castle.tiles.length, 2));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));

    test('throws if tiles < width * height', () => expect(() => newCastle(2,2), throws));
    test('throws if tiles > width * height', () => expect(() => newCastle(1,1), throws));
    test('passes if tiles == width * height', () => expect(() => newCastle(1,2), returnsNormally));
  });

}
