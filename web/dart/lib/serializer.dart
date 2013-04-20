library serializer;
import 'dart:json';
import '../tile.dart';

Map fromJson(String json) {
  Map data = parse(json);
  data['tiles'] = _mapTiles(data['tiles']);
  return data;
}

List _mapTiles(List tiles) {
  var map = tiles.map((t) => new Tile(t['x'], t['y'], t['collision']));
  return map.toList();
}
