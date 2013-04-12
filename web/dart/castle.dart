library castle;
import 'layer.dart';

class Castle {
  final String name;
  final int width, height;
  Set<Layer> _layers = new Set();

  Castle(this.name, {this.width: 5, this.height: 5});

  Castle.fromJSON();

  get layers => _layers;

}

//castle = {
//  name: 'Baldurs Gate',
//  width: 5,
//  height: 5,
//  layers: [
//    {
//      name: 'xxx',
//      tileset: 'xxxx',
//      tiles: []
//    }
//    background: [],
//    buildings: [],
//    ...
//  ],
//  heroes: []
//
//}
