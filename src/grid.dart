library grid;
import 'tile.dart';

class Grid {
  List tiles;
  int rows;
  int columns;

  Grid (this.rows, this.columns) {
    tiles = [];
    for (var i = 0; i < rows; i++) {
      tiles.add([]);
      for (var j = 0; j < columns; j++) {
        tiles[i].add(new Tile());
      }
    }
  }
}
