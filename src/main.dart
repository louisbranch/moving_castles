library app;
import 'castle.dart';
import 'grid.dart' as grid;

void main() {
  var castle = new Castle();
  grid.plot(castle.dimensions, 'body');
}
