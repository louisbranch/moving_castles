library grid;
import 'package:web_ui/web_ui.dart';
import 'castle.dart';
import 'lib/2d.dart' as twod;

class Grid extends WebComponent {
  List layers;

  void from(Castle castle) {
    layers = twod.createGrid(struct.layers);
  }

}
