library castle;
import 'structure.dart';

class Castle extends Structure {

  Castle(name, layers, {width: 5, height: 5}) : super(name, layers, width, height);

  Castle.fromJSON(json) : super.fromJSON(json);

}
