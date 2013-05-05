part of event;

class Event {
  factory Event(Object object) {
    if (object is Castle) {
      return new CastleEvent(object);
    }
  }
}

class Mana {
  int _pool = 0;
  Queue log = new Queue();

  Mana([int start = 0]) {
    this + start;
  }

  operator +(int mana) {
    log.add(mana);
    _pool = _pool + mana;
    return _pool;
  }

  operator -(int mana) => _pool = _pool - mana;
}

class CastleEvent implements Event {
  Castle castle;
  List eventTypes = [];

  CastleEvent(Castle this.castle);

  /*
   * Add mana to a building if
   * castle has enough mana available
   */
  void activate(Building building) {
    int mana = building.manaRequired;

    if (mana <= castle.mana) {

      building.on(this);
    }

  }

  /**
    * If placement is valid, assign the [building] to the [tile]
    * and call on [building] method passing the [castle]
    */
  void build(Building building, Tile tile) {
    if (validPlacement(building, tile)) {
      map[tile] = building;
      powerBuilding(building);
    }
  }


}

//new Event(castle).build(building, tile);
//new Event(castle).activate(building);
//
//Events:
//  * castle mana - 2
//  * building power on
//  * castle mana + 5

// Events build:
// * map: building add to tile
// * building power on
