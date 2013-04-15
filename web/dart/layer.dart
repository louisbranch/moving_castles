library layer;
import 'tile.dart';

class Layer {
  String name, tileset;
  int width, height;
  List<Tile> _tiles;

  Layer(this.name, this.tileset, this._tiles, this.width, this.height) {
    if (_tiles.length != width * height) {
      throw new ExpectException("Number of tiles doesn't match area size");
    }
  }

  get tiles => _tiles;

}
