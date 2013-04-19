import 'package:unittest/unittest.dart';
import '../web/dart/tile.dart';

void main() {

  group('new', () {
    var tile = new Tile(1,2);
    test('has a sprite x coordinate', () => expect(tile.x, 1));
    test('has a sprite y coordinate', () => expect(tile.y, 2));
    test('collision defaults to false', () => expect(tile.collision, false));
  });

}
