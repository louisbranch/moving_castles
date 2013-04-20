library castle;
import 'tile.dart';
import 'lib/serializer.dart' as serializer;

class Castle {
  String name, tileset;
  int width, height;
  List<Tile> tiles;

  Castle(this.name, this.tiles, this.width, this.height, [this.tileset]) {
    if (tiles.length != width * height) {
      throw "Number of tiles doesn't match area size";
    }
  }

  Castle.fromJson(String json) {
    Map data = serializer.fromJson(json);
    name = data['name'];
    tiles = data['tiles'];
    width = data['width'];
    height = data['height'];
    tileset = data['tileset'];
  }
}
