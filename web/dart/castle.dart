library castle;
import 'hero.dart';
import 'building.dart';
import 'tile.dart';

class Castle {
  final String name;
  int x;
  int y;
  Set<Hero> heroes = new Set();
  Set<Building> buildings = new Set();
  List tiles = [];

  Castle({this.name, this.x: 5, this.y: 5}) {
    _buildTiles();
  }

  List _buildTiles () {
    for (int i = 0; i < x; i++) {
      tiles.add([]);
      for (int j = 0; j < y; j++) {
        Tile tile = new Tile(x: i, y: j);
        tiles[i].add(tile);
      }
    }
  }

  void hire(Hero h) => heroes.add(h);
  bool dismiss(Hero h) => heroes.remove(h);

  void construct(Building b) => buildings.add(b);
  bool rase(Building b) => buildings.remove(b);

}
