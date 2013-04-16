import 'package:unittest/unittest.dart';
import '../web/dart/serializer.dart';
import '../web/dart/castle.dart';
import '../web/dart/layer.dart';
import '../web/dart/tile.dart';

void main() {

  group('Serialize castle from json', () {
    String json = '''{
      "name" : "Baldurs Gate",
      "layers" : [
        {
          "name" : "background",
          "tileset" : "castle.png",
          "tiles" : [
            {
              "x" : 1,
              "y" : 1,
              "collision" : false
            }
          ],
          "width" : 2,
          "height" : 2
        }
      ],
      "width" : 2,
      "height" : 2
    }''';
    var castle = castleFromJson(json);
    var layer = castle.layers.first;
    var tile = layer.tiles.first;

    test('create a new castle', () => expect(castle is Castle, true));
    test('castle has a list of layers', () => expect(layer is Layer, true));
    test('layer has  a list of tiles', () => expect(tile is Tile, true));
  });

}

