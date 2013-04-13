library twod;

List createGrid(List layers, width, height) {
  List temp = [];
  int offset = 0;
  for(int i = 0; i < height; i++) {
    var row = layers.sublist(offset, offset + width);
    temp.add(row);
    offset += width;
  }
  return temp;
}
