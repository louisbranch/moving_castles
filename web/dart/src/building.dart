part of building;

abstract class Building {
  String _name;
  int _mana_required = 0;
  int _mana_using = 0;
  //int _cost;
  //int _build_time;
  //int _cooldown;

  String toString() => _name;

  int get mana => _mana_required;

  /** Triggered when building is built or gains mana */
  dynamic on(Castle castle);

  /** Triggered when building is rased or loses mana */
  dynamic off(Castle castle);

}

class ManaSource extends Building {
  String _name = 'Mana Source';

  /** Increase mana pool */
  int on(Castle castle) => castle.addMana(5);

  /** Decrease mana pool */
  int off(Castle castle) => castle.removeMana(5);

}
