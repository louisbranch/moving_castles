import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import '../web/dart/castle.dart';
import '../web/dart/tile.dart';
import '../web/dart/building.dart';

class TileMock extends Mock implements Tile {}

void main() {

  var castle = new Castle('Baldurs Gate', [[], []], 'castle.png');

  group('#new', () {

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has 2 dimensional list of tiles', () => expect(castle.tiles[0], []));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));

  });

  group('#building', () {
    var building = new Building('Forge');

    group('when tile is valid', () {
      Tile tile = new TileMock();
      tile.when(callsTo('valid')).thenReturn(true);
      bool result = castle.build(tile, building);
      test('returns true', () => expect(result, isTrue));
      test('sets tile\'s building', () {
        //FIXME
        //tile.getLogs(callsTo('building=', building)).verify(happenedOnce);
      });
    });

    group('when tile is invalid', () {
      Tile tile = new TileMock();
      tile.when(callsTo('valid')).thenReturn(false);
      bool result = castle.build(tile, building);
      test('returns false', () => expect(result, isFalse));
    });

  });

}
