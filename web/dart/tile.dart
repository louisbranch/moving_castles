library tile;

class Tile {
  int x;
  int y;
  String coordinates;

  Tile ({this.x, this.y}) {
    coordinates = '$x:$y';
  }

}
