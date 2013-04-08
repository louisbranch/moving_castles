import 'package:unittest/unittest.dart';
import '../web/dart/tile.dart';

void main() {

  test('builds tiles matrix', () {
    expect(Tile.build(1,1)[0][0], new isInstanceOf<Tile>());
  });

  group('New Tile', () {
    var tile = new Tile(x: 2, y: 2);
    test('has coordinates', () => expect(tile.coordinates, '2:2'));

  });

}
