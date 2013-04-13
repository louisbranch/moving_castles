library grid;

class Grid {
  List _layers = [];

  get layers => _layers;

  void create2dList(layers, width, height) {
    int offset = 0;
    for(int i = 0; i < height; i++) {
      var row = layers.sublist(offset, offset + width);
      _layers.add(row);
      offset += width;
    }
  }

}
