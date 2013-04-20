library building_test;
import 'package:unittest/unittest.dart';
import '../web/dart/building.dart';

void main() {

  group('#new', () {
    var building = new Building('Forge');

    test('has a name', () => expect('Forge', building.name));
  });

}


