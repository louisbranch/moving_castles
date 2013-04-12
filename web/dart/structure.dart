library castle;
import 'layer.dart';

abstract class Structure {
  final String name;
  final int width, height;
  Set<Layer> _layers = new Set();

  Structure(this.name, this.width, this.height);

  get layers => _layers;

}

