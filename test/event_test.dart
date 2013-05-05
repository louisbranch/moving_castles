import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import '../web/dart/event.dart';
import '../web/dart/castle.dart';

void main() {

  group('[event factory]', () {

    group('[when object is a castle]', () {
      var castle = new Castle('Baldurs Gate', 0);
      var event = new Event(castle);
      print(event);
      test('returns a castle event', () => expect(event is CastleEvent, isTrue));
    });

  });

  group('[mana]', () {
    var mana = new Mana();
    test('', () => expect(mana + 1, 1));
    test('', () => expect(mana + 1, 2));
    test('', () => expect(mana - 5, -3));
  });

}

