library serializer;
import 'dart:json';
import 'castle.dart';
import 'layer.dart';
import 'tile.dart';


Castle castleFromJson(String json) {
  Map d = parse(json);
  List layers = _mapLayers(d['layers']);
  return new Castle(d['name'], layers, d['width'], d['height']);
}

List _mapLayers(List layers) {
  var map = layers.map((l) {
    List tiles =  _mapTiles(l['tiles']);
    return new Layer(l['name'], l['tileset'], tiles, l['width'], l['height']);
  });
  return map.toList();
}

_mapTiles(List tiles) {
  var map = tiles.map((t) {
    return new Tile(t['x'], t['y'], t['collision']);
  });
  return map.toList();
}
