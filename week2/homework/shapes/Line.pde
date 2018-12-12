class Line {
  PVector begin, end;
  int boxNum=20; // number of boxes on each line
  Box[] boxes=new Box[boxNum];
  
  // set beginning and ending points for a line, passed in from upper classes
  Line(PVector begin, PVector end) {
    this. begin=begin;
    this. end=end;

    // save boxNum of boxes in the box array
    for (int i=0; i<boxNum; i++) {
      boxes[i]=new Box();
    }
  }

  void draw() {

    // draw every box and start moving
    for (Box b : boxes) {
      b.moving(begin, end);
      b.draw();
    }
  }
}
