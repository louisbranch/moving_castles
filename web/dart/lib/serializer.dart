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
  return columns.map((t) => new Tile(disabled: t['disabled'])).toList();
}
