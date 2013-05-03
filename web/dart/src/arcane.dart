part of building;

abstract Arcane extends Building {
  String _name, _color, _school;
  int _level, _max_level;

  void levelUp() {}

}

class SacrificialPit extends Arcane {
  String _name =  'Sacrificial Pit';
  String _color = 'black';
  String _school = 'death';
}

class HolyAltar extends Arcane {
  String _name =  'Holy Altar';
  String _color = 'white';
  String _school = 'life';
}

class ChaosRift extends Arcane {
  String _name =  'Chaos Rift';
  String _color = 'red';
  String _school = 'chaos';
}

class TreeOfLife extends Arcane {
  String _name =  'Tree of Life';
  String _color = 'green';
  String _school = 'nature';
}

class DreamHalls extends Arcane {
  String _name =  'Dream Halls';
  String _color = 'blue';
  String _school = 'sorcery';
}
