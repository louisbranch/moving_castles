library twod;

List createGrid(list, width, height) {
  List temp = [];
  int offset = 0;
  for(int i = 0; i < height; i++) {
    var row = list.sublist(offset, offset + width);
    temp.add(row);
    offset += width;
  }
  return temp;
}
