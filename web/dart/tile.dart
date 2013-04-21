library tile;
import 'building.dart';

class Tile {
  bool powered;
  Building building;
  List<String> errors = [];

  Tile({this.powered: false, this.building});

  bool isFree() => building == null;

  bool valid() {
    errors.clear();
    if (!powered) { errors.add('Not mana powered'); }
    if (!isFree()) { errors.add('Already has a building'); }
    return errors.isEmpty;
  }

}
