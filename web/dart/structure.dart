library castle;
import 'layer.dart';

abstract class Structure {
  final String name;
  final int width, height;
  final List layers;

  Structure(this.name, this.layers, this.width, this.height);

}

