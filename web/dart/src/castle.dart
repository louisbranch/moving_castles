part of castle;

class Castle implements EventListener {
  Pid pid;
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
    this.pid = Event.register(this);
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
  void set mana(int n) {
    _mana = _mana + n;
  }

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

  /** Find if any surrounding [tiles] has already a [building] */
  bool hasBuildingNext(Tile tile) {
    List tiles = surroundingTiles(tile);
    return tiles.any((t) => map[t] is Building);
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
    * Check if [tile] is empty and is directly connected to
    * another [building]
    * Add each error to [errors] list
    */
  bool validPlacement(Building building, Tile tile) {
    errors.clear();
    if (map[tile] is Building) {
      errors.add('Tile already has a building');
    }

    if (buildings.length >= 1 && !hasBuildingNext(tile)) {
      errors.add('Building needs to be next to another building');
    }

    return errors.isEmpty;
  }

  /* EventListener message looping */
  void send (Map message, [Pid sender_pid]) {
    switch (message['type']) {
      case 'mana:change':
        mana = message['mana'];
        break;
      case 'building:build':
        _build(message['building'], message['tile']);
        break;
      case 'building:activate':
        _activate(message['building']);
        break;
      default:
        throw 'Message unknown';
    }
  }

  /* Add mana to a building if enough mana is available */
  void _activate(Building building) {
    int mana_required = building.manaRequired;

    if (mana_required <= mana) {
      new Event(this.pid, {'type': 'mana:change', 'mana': -mana_required});
      new Event(building.pid, {'type': 'activate'});
    }

  }

  /**
    * If placement is valid, assign the [building] to the [tile]
    * and call on [building] method passing the [castle]
    */
  void _build(Building building, Tile tile) {
    if (validPlacement(building, tile)) {
      map[tile] = building;
    }
  }

}
