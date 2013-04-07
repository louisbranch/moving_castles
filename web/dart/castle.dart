library castle;
import 'hero.dart';
import 'building.dart';

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
    for (var i = 0; i < x; i++) {
      tiles.add([]);
      for (var j = 0; j < y; j++) {
        tiles[i].add('new Tile()');
      }
    }
  }

  void hire(Hero h) => heroes.add(h);
  bool dismiss(Hero h) => heroes.remove(h);

  void construct(Building b) => buildings.add(b);
  bool rase(Building b) => buildings.remove(b);

}
