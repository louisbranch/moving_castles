part of castle;

class Tile {
  int x, y;

  Tile(this.x, this.y);

  /** Creates a tile from a map representation */
  Tile.fromMap(Map map) {
    x = map['x'];
    y = map['y'];
  }

  /** Return tile coordinates */
  String toString() => '$x:$y';

}
