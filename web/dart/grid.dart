library grid;
import 'package:web_ui/web_ui.dart';
import 'lib/2d.dart' as twod;

class Grid extends WebComponent {
  List _layers = [];

  get layers => _layers;

  void from(layers, width, height) {
    _layers = twod.createGrid(layers, width, height);
  }

}
