import 'package:unittest/unittest.dart';
import '../src/castle.dart';
import '../src/hero.dart';

void main() {

  group('New Castle', () {
    var castle = new Castle(name: 'Baldurs Gate');

    test('has a name', () => expect('Baldurs Gate', castle.name));
    test('x size defaults to 5', () => expect(5, castle.x));
    test('y size defaults to 5', () => expect(5, castle.y));
    test('dimensions is x * y', () => expect(25, castle.dimensions));
    test('has no heroes', () => expect(true, castle.heroes.isEmpty));
    test('has no rooms', () => expect(true, castle.rooms.isEmpty));

  });

  group('Castle heroes', () {
    var castle = new Castle();
    var hero = new Hero();

    test('hire', () {
      castle.hire(hero);
      expect(true, castle.heroes.contains(hero));
    });

    test('dismiss', () {
      castle.hire(hero);
      castle.dismiss(hero);
      expect(false, castle.heroes.contains(hero));
    });

  });

}
