library twod;
import '../castle.dart';

List createGrid(Castle castle) {
  List grid = [];
  int offset = 0;
  for(int i = 0; i < castle.height; i++) {
    var row = castle.tiles.sublist(offset, offset + castle.width);
    grid.add(row);
    offset += castle.width;
  }
  return grid;
}
