library tile;

class Tile {
  final int x, y;
  final bool collision;
  //bool buildable;
  //bool hasBuild;

  Tile(this.x, this.y, [this.collision = false]);
}
