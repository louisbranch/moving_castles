library castle;
import 'lib/serializer.dart' as serializer;

class Castle {
  String name, tileset;
  List<List> tiles;

  Castle(this.name, this.tiles, [this.tileset]);

  Castle.fromJson(String json) {
    Map data = serializer.fromJson(json);
    name = data['name'];
    tiles = data['tiles'];
    tileset = data['tileset'];
  }

  build(Tile tile, Building building) { }

}
