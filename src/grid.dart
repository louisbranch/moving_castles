library grid;
import 'dart:html';

void plot(int dimensions, String matcher) {
  var root = document.query(matcher);
  var el = new DivElement();

  while(dimensions > 0) {
    var unit = new DivElement();
    unit.classes.add('grid-1x1');
    el.children.add(unit);
    dimensions--;
  }

  print(el.children);

  root.children.add(el);
}
