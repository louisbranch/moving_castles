library twod;

List createGrid(List layers, width, height) {
  List grid = [];
  int offset = 0;
  for(int i = 0; i < height; i++) {
    var row = layers.sublist(offset, offset + width);
    grid.add(row);
    offset += width;
  }
  return grid;
}
