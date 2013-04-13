library grid;
import 'package:web_ui/web_ui.dart';
import 'structure.dart';
import 'lib/2d.dart' as twod;

class Grid extends WebComponent {
  List _layers = [];

  get layers => _layers;

  void from(Structure struct) {
    _layers = twod.createGrid(struct.layers, struct.width, struct.height);
  }

}
