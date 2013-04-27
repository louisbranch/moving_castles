part of castle;

class Tile {
  int x, y;
  bool powered;
  List<String> errors = [];

  Tile(this.x, this.y, {this.powered: false});

  // Creates a tile from a map representation
  Tile.fromMap(Map map);

  bool valid() {
    errors.clear();
    if (!powered) { errors.add('Not mana powered'); }
    return errors.isEmpty;
  }

}
