part of building;

abstract class Building {
  String name;
  //int cost;
  //int build_time;

  String toString() => name;

}

class ManaSource extends Building {
  String name = 'Mana Source';

  /** Power tile built on and all surrounding tiles */
  void powerOn(Castle castle, Tile tile) {
    _selfTile(castle, tile, true);
    _surroundingTiles(castle, tile, true);
  }

  /** Unpower tile built on and all surrounding tiles */
  void powerOff(Castle castle, Tile tile) {
    _selfTile(castle, tile, false);
    _surroundingTiles(castle, tile, false);
  }

  void _selfTile(Castle castle, Tile tile, bool power) {
    tile.powered = power;
  }

  void _surroundingTiles(Castle castle, Tile tile, bool power) {
    castle.surroundingTiles(tile).forEach((t) => t.powered = power);
  }

}
