library structure;
import 'layer.dart';
import 'dart:json';

abstract class Structure {
  String name;
  int width, height;
  List layers;
  var layerFactory;

  Structure(this.name, this.layers, this.width, this.height);

  Structure.fromJSON(String json, {this.layerFactory: Layer}) {
    Map data = parse(json);
    name = data['name'];
    layers = data['layers'].map(_parseLayer).toList();
    width = data['width'];
    height = data['height'];
  }

  _parseLayer(Map layer) {
    return new Layer(
        layer['name'],
        layer['tileset'],
        layer['tiles'],
        layer['width'],
        layer['height']
    );
  }

}

