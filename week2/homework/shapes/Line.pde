class Line {
  PVector begin, end;
  int boxNum=20;
  Box[] boxes=new Box[boxNum];

  Line(PVector begin, PVector end) {
    this. begin=begin;
    this. end=end;

    for (int i=0; i<boxNum; i++) {
      boxes[i]=new Box();
    }
  }

  void draw() {

    for (Box b : boxes) {
      b.moving(begin, end);
      b.draw();
    }
  }
}
