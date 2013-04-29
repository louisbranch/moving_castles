part of building;

abstract class Building {
  String name;
  //int cost;
  //int build_time;

  String toString() => name;

}

class ManaSource extends Building {
  String name = 'Mana Source';
}
