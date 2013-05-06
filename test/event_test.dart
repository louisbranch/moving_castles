import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import '../web/dart/event.dart';

class MockObject extends Mock {

  void listener (Map message, Pid pid) {
    if (message.containsKey('mana:change')) {
      print('mana:change ' + message['mana:change'].toString());
    } else {
      print('else ' + message.toString());
    }
  }

}

void main() {

  group('[registering process]', () {
    var mock; Pid pid;

    setUp(() {
      mock = new MockObject();
      pid = Event.register(mock);
    });

    group('[when object does not have a pid]', () {
      test('returns a process id', () => expect(pid, isNot(isNull)));
    });

  });

  group('[finding process]', () {
    var mock; Pid pid;

    setUp(() {
      mock = new MockObject();
      pid = Event.register(mock);
    });

    test('returns process', () => expect(Event.find(pid), mock));
  });

  group('[new event]', () {
    var mock; Pid pid; Map message;

    setUp(() {
      mock = new MockObject();
      pid = Event.register(mock);
      message = {'mana:change' : 5};
      new Event(pid, message);
    });

    test('calls process listener method with data message', () {
      mock.getLogs(callsTo('listener', message)).verify(happenedOnce);
    });

  });

}

