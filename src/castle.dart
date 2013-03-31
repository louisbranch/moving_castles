library castle;

class Castle {
  String name;
  int x;
  int y;

  Castle({this.name, this.x: 5, this.y: 5}) {}

  int dimensions() {
    return this.x * this.y;
  }

}
