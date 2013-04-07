library building;
import 'tile.dart';

class Building {
  final String name;
  final int x;
  final int y;
  List tiles;

  Building({this.name, this.x: 2, this.y: 2}) {
    tiles = Tile.build(x, y);
  }
}
