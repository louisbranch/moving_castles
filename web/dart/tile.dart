library tile;

class Tile {
  final int x_coord, y_coord;
  final bool collision;
  //bool buildable;
  //bool hasBuild;

  Tile(this.x_coord, this.y_coord, {this.collision: false});
}
