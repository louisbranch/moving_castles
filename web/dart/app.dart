library app;
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'grid.dart';

void main() {
  var grid = new Grid()
    ..host = new DivElement()
    ..name = 'component created in code';

  var lifecycleCaller = new ComponentItem(grid)..create();
  document.body.nodes.add(grid.host);
  lifecycleCaller.insert();
}
