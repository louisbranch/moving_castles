part of castle;

class Castle {
  String name, tileset;
  Map<Tile, Building> map = {};

  // Create a castle with an empty tiles map equals to
  // width * height
  Castle(this.name, width, height, [this.tileset]) {
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        var tile = new Tile(x, y);
        map[tile] = null;
      }
    }
  }

  // Create a castle from a json representation
  Castle.fromJson(String json) {
    Map data = Json.parse(json);
    name = data['name'];
    data['map'].forEach((t) {
      var tile = new Tile.fromMap(t);
      map[tile] = null;
    });
    tileset = data['tileset'];
  }

  // Returns a list of all tiles
  List<Tile> get tiles => map.keys;

  // Returns a list of all buildings
  List<Building> get buildings => map.values;

  // Returns a tile that matches a coordinate
  // or else returns null
  Tile findTile(int x, int y) => tiles.firstWhere((t) => t.x == x && t.y == y
                                 , orElse: () => null);

  /// Coordinates for surrounding tiles
  final List _coordinates = [
    [-1, -1], [-1, 0], [-1, +1],
    [0, -1],           [+1, 0],
    [+1, -1], [0, +1], [+1, +1]
  ];

  // Returns 8 surrounding tiles from a coordinate
  List<Tile> surroundingTiles(Tile tile) {
    List tiles = [];

    _coordinates.forEach((coord) {
      int x = tile.x + coord[0];
      int y = tile.y + coord[1];

      Tile surrounding = findTile(x, y);

      if (surrounding != null) {
        tiles.add(surrounding);
      }

    });

    return tiles;
  }

}
