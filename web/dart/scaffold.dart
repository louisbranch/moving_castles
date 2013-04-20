library scaffold;

/// Scaffolding representation of a json resource
/// to be serialized by the app
String castle = '''{
  "name" : "Baldurs Gate",
  "tiles" : [
    [
      {
        "x" : 3,
        "y" : 2
      },
      {
        "x" : 1,
        "y" : 1,
        "collision" : false
      }
    ],
    [
      {
        "x" : 2,
        "y" : 1,
        "collision" : false
      },
      {
        "x" : 1,
        "y" : 1
      }
    ]
  ],
  "tileset" : "castle.png"
}''';
