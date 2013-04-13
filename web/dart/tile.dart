library tile;

class Tile {
  final int x_coord, y_coord;
  final bool collision;

  Tile(this.x_coord, this.y_coord, {this.collision: false});
}
