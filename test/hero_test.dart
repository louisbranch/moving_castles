import 'package:unittest/unittest.dart';
import '../web/dart/hero.dart';

void main() {

  group('new', () {
    var hero = new Hero('Minsc');

    test('has a name', () => expect('Minsc', hero.name));
    test('level defaults to 1', () => expect(1, hero.level));
    test('starts with 0 xp', () => expect(0, hero.xp));

  });

}

