library castle;
import 'hero.dart';

class Castle {
  final String name;
  final int x;
  final int y;
  Set<Hero> heroes = new Set();

  Castle({this.name, this.x: 5, this.y: 5}) {}

  int get dimensions => this.x * this.y;

  void hire(Hero h) => heroes.add(h);
  bool dismiss(Hero h) => heroes.remove(h);

}
