part of castle;

class Castle {
  String name, tileset;
  Map<Tile, Building> map = {};

  // Create a castle with an empty tiles map equals to
  // its square size
  Castle(this.name, size, [this.tileset]) {
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        var tile = new Tile(x, y);
        map[tile] = null;
      }
    }
  }

  // Create a castle from a json representation
  Castle.fromJson(String castle) {
    Map data = json.parse(castle);
    name = data['name'];
    data['map'].forEach((t) {
      var tile = new Tile.fromMap(t);
      map[tile] = null;
    });
    tileset = data['tileset'];
  }

  // Returns a list of all tiles
  List<Tile> get tiles => map.keys.toList();

  // Returns a list of all buildings
  List<Building> get buildings => map.values.toList();

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

  // Create a 2 dimensional tile list using
  // their coordinates
  List toGrid() {
  }

}
