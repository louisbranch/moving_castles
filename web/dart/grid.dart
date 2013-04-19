library grid;
import 'package:web_ui/web_ui.dart';
import 'structure.dart';
import 'lib/2d.dart' as twod;

class Grid extends WebComponent {
  List layers;

  void from(Structure struct) {
    layers = twod.createGrid(struct.layers);
  }

}
