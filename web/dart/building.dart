library building;
import 'layer.dart';

class Building {
  final String name;
  final int width, height;
  Set<Layer> _layers = new Set();

  Building(this.name, {this.width: 2, this.height: 2});

  Building.fromJSON();

  get layers => _layers;

}
