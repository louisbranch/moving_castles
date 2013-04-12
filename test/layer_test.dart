import 'package:unittest/unittest.dart';
import '../web/dart/layer.dart';
import '../web/dart/tile.dart';

void main() {

  group('New Layer:', () {
    var tiles = [];
    while (tiles.length < 25) { tiles.add(new Tile()); }
    var layer = new Layer('Floor', '/floor.png', tiles);

    test('has a name', () => expect(layer.name, 'Floor'));
    test('width size defaults to 5', () => expect(layer.width, 5));
    test('height size defaults to 5', () => expect(layer.height, 5));

  });

}

