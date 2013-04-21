import 'package:unittest/unittest.dart';
import '../web/dart/tile.dart';
import '../web/dart/building.dart';

void main() {
  var building = new Building('Forge');

  test('can be powered', () {
    var tile = new Tile(powered: true);
    expect(tile.powered, true);
  });

  group('#isFree', () {

    test('is false when has a building', () {
      var tile = new Tile();
      expect(tile.isFree(), isFalse);
    });

    test('is true when has a building', () {
      var tile = new Tile(building: building);
      expect(tile.isFree(), isTrue);
    });

  });

  group('#valid', () {

    group('when is not powered', () {
      var tile = new Tile(powered: false, building: building);
      bool result = tile.valid();
      test('returns false', () => expect(result, isFalse));
      test('adds error to error list', () => expect(tile.errors, contains('Not mana powered')));
    });

    group('when is already has a building', () {
      var tile = new Tile(powered: true, building: building);
      bool result = tile.valid();
      test('returns false', () => expect(result, isFalse));
      test('adds error to error list', () => expect(tile.errors, contains('Already has a building')));
    });

    group('when is powered and is free', () {
      var tile = new Tile(powered: true);
      bool result = tile.valid();
      test('returns true', () => expect(tile.valid(), isTrue));
      test('clears errors list', () => expect(tile.errors.isEmpty, isTrue));
    });

  });

}
