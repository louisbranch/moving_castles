import 'package:unittest/unittest.dart';
import '../web/dart/tile.dart';

void main() {

  group('new', () {
    var tile = new Tile(disabled: true);
    test('can be disabled', () => expect(tile.disabled, true));
  });

}
