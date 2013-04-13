library app;
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'grid.dart';
import 'castle.dart';

void main() {
  var grid = new Grid()
    ..host = new DivElement();

  var castle = new Castle('Baldurs Gate');
  grid.from(castle);

  var lifecycleCaller = new ComponentItem(grid)..create();
  document.body.nodes.add(grid.host);
  lifecycleCaller.insert();
}
