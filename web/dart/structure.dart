library structure;
import 'serializer.dart' as serializer;
import 'layer.dart';

abstract class Structure {
  String name;
  int width, height;
  List<Layer> layers;

  Structure(this.name, this.layers, this.width, this.height);

  Structure.fromJson(String json) {
    Map data = serializer.fromJson(json);
    name = data['name'];
    layers = data['layers'];
    width = data['width'];
    height = data['height'];
  }

}

