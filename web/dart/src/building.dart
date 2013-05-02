part of building;

abstract class Building {
  String name;
  bool _needPower = true;
  //int cost;
  //int build_time;

  String toString() => name;

  bool get needPower => _needPower;

  /**
    * Triggered when building is built or
    * receives power
    */
  void powerOn(Castle castle, Tile tile);

  /**
    * Triggered when building is rased or
    * loses power
    */
  void powerOff(Castle castle, Tile tile);

}

class ManaSource extends Building {
  String name = 'Mana Source';
  bool _needPower = false;

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

class SummoningCircle extends Building {}
