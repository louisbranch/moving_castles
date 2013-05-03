part of castle;

class Castle {
  String name, tileset;
  Map<Tile, Building> map = new Map();
  List _grid;
  int _mana = 0;

  /** List errors during validations */
  List<String> errors = [];

  /**
   * Create a [castle] with an empty [tiles] map equals to
   * its square [size]
   */
  Castle(this.name, size, [this.tileset]) {
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        var tile = new Tile(x, y);
        map[tile] = null;
      }
    }
  }

  /** Create a [castle] from a [json] representation */
  Castle.fromJson(String castle) {
    Map data = json.parse(castle);
    name = data['name'];
    data['map'].forEach((t) {
      var tile = new Tile.fromMap(t);
      map[tile] = null;
    });
    tileset = data['tileset'];
  }

  int get mana => _mana;
  int addMana(int num) => _mana = _mana + num;
  int removeMana(int num) => _mana = _mana - num;

  /** Returns a list of all [tiles] */
  List<Tile> get tiles => map.keys.toList();

  /** Returns a list of all buildings */
  List<Building> get buildings => map.values.toList();

  /**
    * Returns a cached 2d list of [tiles] and [buildings]
    * as a map {'tile': <Tile>, 'building': <Building>}
    */
  List<List> get grid {
    if (_grid == null) {
      _grid = _createGrid();
    }
    return _grid;
  }

  /**
    * Returns a [tile] that matches a coordinate
    * or else returns null
    */
  Tile findTile(int x, int y) => tiles.firstWhere((t) => t.x == x && t.y == y
                                 , orElse: () => null);

  /** Coordinates for surrounding [tiles] */
  final List _coordinates = [[-1, 0], [0, -1], [1, 0], [0, 1]];

  /** Returns 4 surrounding [tiles] from a coordinate */
  List<Tile> surroundingTiles(Tile tile) {
    List tiles = [];

    _coordinates.forEach((coord) {
      int x = tile.x + coord[0];
      int y = tile.y + coord[1];

      Tile surrounding = findTile(x, y);

      if (surrounding is Tile) {
        tiles.add(surrounding);
      }

    });

    return tiles;
  }

  /**
    * Create a 2 dimensional [tile] : [building] list using
    * [tiles] coordinates
    */
  List _createGrid() {
    int size = math.sqrt(map.length).toInt();
    List grid = new List(size);

    map.forEach((tile, building) {
      if (grid[tile.x] == null) { grid[tile.x] = new List(size); }
      grid[tile.x][tile.y] = { 'tile' : tile, 'building' : building };
    });

    return grid;
  }

  void select(Tile tile) => print(tile);

  /**
    * If placement is valid, assign the [building] to the [tile]
    * and call on [building] method passing the [castle]
    */
  void build(Building building, Tile tile) {
    if (validPlacement(building, tile)) {
      map[tile] = building;
      building.on(this);
    }
  }

  /**
    * Check if [tile] is empty and is directly connected to
    * another [building]
    * Add each error to [errors] list
    */
  bool validPlacement(Building building, Tile tile) {
    errors.clear();
    if (map[tile] is Building) { errors.add('Tile already has a building'); }
    // TODO: find surronding tiles and check if they have a building
    return errors.isEmpty;
  }

}
