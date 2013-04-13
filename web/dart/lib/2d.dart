library twod;

List createGrid(Set layers, width, height) {
  var list = layers.toList();
  List temp = [];
  int offset = 0;
  for(int i = 0; i < height; i++) {
    var row = list.sublist(offset, offset + width);
    temp.add(row);
    offset += width;
  }
  return temp;
}
