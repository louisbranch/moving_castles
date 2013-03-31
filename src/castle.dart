library castle;
import 'hero.dart';

class Castle {
  String name;
  int x;
  int y;
  Set<Hero> heroes;

  Castle({this.name, this.x: 5, this.y: 5}) {
    this.heroes = new Set();
  }

  int get dimensions => this.x * this.y;

  void hire(Hero hero) {
    this.heroes.add(hero);
  }

  void dismiss(Hero hero) {
    this.heroes.remove(hero);
  }

}
