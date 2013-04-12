library building;
import 'tile.dart';

class Building {
  final int x, y;
  final String name;
  List<Tile> tiles;

  Building(this.name, {this.x: 2, this.y: 2}) {
  }
}
