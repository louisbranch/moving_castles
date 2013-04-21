library tile;
import 'building.dart';

class Tile {
  bool powered;
  Building _building;
  List<String> errors = [];

  Tile({this.powered: false, building}) {
    if (building != null) {
      this.building = building;
    }
  }

  get building => _building;
  set building(Building struct) {
    _building = struct;
    struct.tile = this;
  }

  bool isFree() => building == null;

  bool valid() {
    errors.clear();
    if (!powered) { errors.add('Not mana powered'); }
    if (!isFree()) { errors.add('Already has a building'); }
    return errors.isEmpty;
  }

}
