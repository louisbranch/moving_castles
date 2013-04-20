library grid;
import 'package:web_ui/web_ui.dart';
import 'castle.dart';

class Grid extends WebComponent {
  List layers;

  void from(Castle castle) {
    layers = twod.createGrid(struct.layers);
  }

}
