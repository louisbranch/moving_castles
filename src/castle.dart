library castle;
import 'hero.dart';
import 'building.dart';
import 'grid.dart';

class Castle {
  final String name;
  int x;
  int y;
  Set<Hero> heroes = new Set();
  Set<Building> buildings = new Set();
  Grid grid;

  Castle({this.name, this.x: 5, this.y: 5}) {
    grid = new Grid(x, y);
  }

  int get dimensions => this.x * this.y;

  void hire(Hero h) => heroes.add(h);
  bool dismiss(Hero h) => heroes.remove(h);

  void construct(Building b) => buildings.add(b);
  bool rase(Building b) => buildings.remove(b);

}
