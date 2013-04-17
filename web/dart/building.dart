library building;
import 'structure.dart';

class Building extends Structure {

  Building(name, layers, width, height) : super(name, layers, width, height);

  Building.fromJson(String json) : super.fromJson(json);
}
