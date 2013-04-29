part of building;

abstract class Building {
  String name;
  //int cost;
  //int build_time;

  String toString() => name;

}

class ManaSource extends Building {
  String name = 'Mana Source';

  void powerOn(Castle castle, Tile tile) {
    _selfTile(castle, tile);
    _surroundingTiles(castle, tile);
  }

  void _selfTile(Castle castle, Tile tile) {
    tile.powered = true;
  }

  void _surroundingTiles(Castle castle, Tile tile) {
    castle.surroundingTiles(tile).forEach((t) => t.powered = true);
  }

}
