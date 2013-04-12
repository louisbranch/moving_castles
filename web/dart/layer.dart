library layer;
import 'tile.dart';

class Layer {
  final String name, tileset;
  final int width, height;
  final List<Tile> _tiles;

  Layer(this.name, this.tileset, this._tiles, {this.width: 5, this.height: 5}) {
    if (_tiles.length != width * height) {
      throw new ExpectException("Number of tiles doesn't match area size");
    }
  }

}
