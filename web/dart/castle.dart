library castle;
import 'structure.dart';

class Castle extends Structure {

  Castle(name, layers, width, height) : super(name, layers, width, height);

  Castle.fromJson(String json) : super.fromJson(json);
}
