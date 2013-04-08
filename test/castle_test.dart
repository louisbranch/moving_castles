import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';
import '../web/dart/hero.dart';
import '../web/dart/building.dart';

void main() {

  group('New Castle', () {
    var castle = new Castle(name: 'Baldurs Gate');

    test('has a name', () => expect('Baldurs Gate', castle.name));
    test('x size defaults to 5', () => expect(5, castle.x));
    test('y size defaults to 5', () => expect(5, castle.y));
    test('has no heroes', () => expect(true, castle.heroes.isEmpty));
    test('has no buildings', () => expect(true, castle.buildings.isEmpty));
    test('has a tiles list', () => expect(castle.tiles.length, 5));

  });

  group('Castle heroes', () {
    var castle = new Castle();
    var hero = new Hero();

    test('hire', () {
      castle.hire(hero);
      expect(castle.heroes, contains(hero));
    });

    test('dismiss', () {
      castle.hire(hero);
      castle.dismiss(hero);
      expect(castle.heroes, isNot(contains(hero)));
    });

  });

  group('Castle buildings', () {
    var castle = new Castle();
    var building = new Building();

    test('construct', () {
      castle.construct(building);
      expect(castle.buildings, contains(building));
    });

    test('rase', () {
      castle.construct(building);
      castle.rase(building);
      expect(castle.buildings, isNot(contains(building)));
    });

  });

}
