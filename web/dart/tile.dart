library tile;

class Tile {
  final int x, y;
  String _img;
  Tile _layer;

  Tile ({this.x, this.y, img: '/default_path.png'}) {
    _img = img;
  }

  get coordinates => '$x:$y';

  get layer => _layer;
  set layer(tile) => _layer = tile;

  get img {
    if (layer == null) {
      return _img;
    } else {
      return layer.img;
    }
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
