class Octahedron {
  ArrayList<Line> sides=new ArrayList<Line>();
  float halfLen;
  float halfH;

  // using len from main function as the length of every side of the octahedron
  Octahedron(float len) {
    halfLen=len/2;
    halfH=len*sqrt(2)/2;

     // set all of the vertexes for the octahedron
    PVector vertex1=new PVector (halfLen, halfLen, 0);
    PVector vertex2=new PVector (-halfLen, halfLen, 0);
    PVector vertex3=PVector.mult(vertex1, -1);
    PVector vertex4=PVector.mult(vertex2, -1);
    PVector vertex5=new PVector (0, 0, halfH);
    PVector vertex6=PVector.mult(vertex5, -1);

    // save each side of the octahedron into an array of Line
    sides.add(new Line(vertex1, vertex2));
    sides.add(new Line(vertex1, vertex4));
    sides.add(new Line(vertex1, vertex5));
    sides.add(new Line(vertex1, vertex6));
    sides.add(new Line(vertex2, vertex3));
    sides.add(new Line(vertex2, vertex5));
    sides.add(new Line(vertex2, vertex6));
    sides.add(new Line(vertex3, vertex4));
    sides.add(new Line(vertex3, vertex5));
    sides.add(new Line(vertex3, vertex6));
    sides.add(new Line(vertex4, vertex5));
    sides.add(new Line(vertex4, vertex6));
  }

  // call the draw function in Line class for every side of the octahedron
  void draw() {
    for (Line s : sides) {
      s.draw();
    }
  }
}
