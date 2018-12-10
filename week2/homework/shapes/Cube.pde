class Cube {
  ArrayList<Line> sides=new ArrayList<Line>();
  float halfLen;

  // using len from main function as the length of every side of the cube
  Cube(float len) {
   
    halfLen=len/2;
    
    // set all of the vertexes for the cube
    PVector vertex1=new PVector (-halfLen, -halfLen, halfLen);
    PVector vertex2=new PVector (-halfLen, halfLen, halfLen);
    PVector vertex3=new PVector (halfLen, halfLen, halfLen);
    PVector vertex4=new PVector (halfLen, -halfLen, halfLen);
    PVector vertex5=PVector.mult(vertex4,-1);
    PVector vertex6=PVector.mult(vertex3,-1);
    PVector vertex7=PVector.mult(vertex2,-1);
    PVector vertex8=PVector.mult(vertex1,-1);

    // save each side of the cube into an array of Line
    sides.add(new Line(vertex1, vertex2));
    sides.add(new Line(vertex1, vertex4));
    sides.add(new Line(vertex1, vertex6));
    sides.add(new Line(vertex2, vertex3));
    sides.add(new Line(vertex2, vertex5));
    sides.add(new Line(vertex3, vertex4));
    sides.add(new Line(vertex3, vertex8));
    sides.add(new Line(vertex4, vertex7));
    sides.add(new Line(vertex5, vertex6));
    sides.add(new Line(vertex6, vertex7));
    sides.add(new Line(vertex7, vertex8));
    sides.add(new Line(vertex8, vertex5));
  }

  // call the draw function in Line class for every side of the cube
  void draw() {
    for (Line s : sides) {
      s.draw();
    }
  }
}
