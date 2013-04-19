library twod;

List createGrid(List layers) => layers.map(_to2D).toList();

List _to2D(layer) {
  List grid = [];
  int offset = 0;
  for(int i = 0; i < layer.height; i++) {
    var row = layer.tiles.sublist(offset, offset + layer.width);
    grid.add(row);
    offset += layer.width;
  }
  return grid;
}
