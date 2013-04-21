library castle;
import 'tile.dart';
import 'building.dart';
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

  bool build(Tile tile, Building building) {
    if (tile.valid()) {
      tile.building = building;
      return true;
    } else {
      return false;
    }
  }

}
