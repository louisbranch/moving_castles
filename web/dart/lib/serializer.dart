library serializer;
import 'dart:json';
import '../tile.dart';

Map fromJson(String json) {
  Map data = parse(json);
  data['tiles'] = _mapRows(data['tiles']);
  return data;
}

List _mapRows(List rows) {
  return rows.map(_mapColumns).toList();
}

List _mapColumns(List columns) {
  return columns.map(_parseTile).toList();
}

Tile _parseTile(Map tile) {
  bool powered = tile['powered'] == null ? false : tile['powered'];
  return new Tile(powered: powered);
}
