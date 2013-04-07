library tile;

class Tile {
  int x;
  int y;
  String coordinates;

  Tile ({this.x, this.y}) {
    coordinates = '$x:$y';
  }

  void select() {
    print(coordinates);
  }

  static List build(x, y) {
    List tiles = [];
    for (int i = 0; i < x; i++) {
      tiles.add([]);
      for (int j = 0; j < y; j++) {
        Tile tile = new Tile(x: i, y: j);
        tiles[i].add(tile);
      }
    }
    return tiles;
  }


}
