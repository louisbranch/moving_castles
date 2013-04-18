library layer;
import 'tile.dart';

class Layer {
  final String name, tileset;
  final int width, height;
  final List<Tile> tiles;

  Layer(this.name, this.tileset, this.tiles, this.width, this.height) {
    if (tiles.length != width * height) {
      throw "Number of tiles doesn't match area size";
    }
  }

}
