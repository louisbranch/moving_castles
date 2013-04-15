library castle;
import 'layer.dart';
import 'dart:json';

abstract class Structure {
  String name;
  int width, height;
  List layers;

  Structure(this.name, this.layers, this.width, this.height);

  Structure.fromJSON(String json) {
    Map data = parse(json);
    name = data['name'];
    layers = data['layers'];
    width = data['width'];
    height = data['height'];
  }

}

