library serializer;
import 'dart:json';
import 'castle.dart';
import 'layer.dart';
import 'tile.dart';

Castle castleFromJson(String json) {
  Map d = _fromJson(json);
  return new Castle(d['name'], d['layers'], d['width'], d['height']);
}

Map _fromJson(String json) {
  Map data = parse(json);
  data['layers'] = _mapLayers(data['layers']);
  return data;
}

List _mapLayers(List layers) {
  var map = layers.map((l) {
    List tiles = _mapTiles(l['tiles']);
    return new Layer(l['name'], l['tileset'], tiles, l['width'], l['height']);
  });
  return map.toList();
}

List _mapTiles(List tiles) {
  var map = tiles.map((t) => new Tile(t['x'], t['y'], t['collision']));
  return map.toList();
}
