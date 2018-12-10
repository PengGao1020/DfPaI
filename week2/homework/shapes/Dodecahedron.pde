class Dodecahedron {
  ArrayList<Line> sides=new ArrayList<Line>();
  float halfLen;
  float halfInterL;
  float halfInterS;

  // using len from main function as the length of every side of the dodecahedron
  Dodecahedron(float len) {
    halfLen=len/2;
    halfInterL=len*(1+sqrt(5))/4;
    halfInterS=len/(1+sqrt(5));

     // set all of the vertexes for the dodecahedron
    PVector vertex1=new PVector (0, halfInterL, halfInterS);
    PVector vertex2=new PVector (0, halfInterL, -halfInterS);
    PVector vertex3=PVector.mult(vertex1, -1);
    PVector vertex4=PVector.mult(vertex2, -1);
    PVector vertex5=new PVector (halfInterS, 0, halfInterL);
    PVector vertex6=new PVector (-halfInterS, 0, halfInterL);
    PVector vertex7=PVector.mult(vertex5, -1);
    PVector vertex8=PVector.mult(vertex6, -1);
    PVector vertex9=new PVector (halfInterL, halfInterS, 0);
    PVector vertex10=new PVector (halfInterL, -halfInterS, 0);
    PVector vertex11=PVector.mult(vertex9, -1);
    PVector vertex12=PVector.mult(vertex10, -1);
    PVector vertex13=new PVector (halfLen, halfLen, halfLen);
    PVector vertex14=new PVector (halfLen, -halfLen, halfLen);
    PVector vertex15=new PVector (-halfLen, -halfLen, halfLen);
    PVector vertex16=new PVector (-halfLen, halfLen, halfLen);
    PVector vertex17=PVector.mult(vertex15, -1);
    PVector vertex18=PVector.mult(vertex16, -1);
    PVector vertex19=PVector.mult(vertex13, -1);
    PVector vertex20=PVector.mult(vertex14, -1);

    // save each side of the dodecahedron into an array of Line
    sides.add(new Line(vertex1, vertex2));
    sides.add(new Line(vertex1, vertex13));
    sides.add(new Line(vertex1, vertex16));
    sides.add(new Line(vertex2, vertex17));
    sides.add(new Line(vertex2, vertex20));
    sides.add(new Line(vertex3, vertex4));
    sides.add(new Line(vertex3, vertex18));
    sides.add(new Line(vertex3, vertex19));
    sides.add(new Line(vertex4, vertex14));
    sides.add(new Line(vertex4, vertex15));
    sides.add(new Line(vertex5, vertex6));
    sides.add(new Line(vertex5, vertex13));
    sides.add(new Line(vertex5, vertex14));
    sides.add(new Line(vertex6, vertex15));
    sides.add(new Line(vertex6, vertex16));
    sides.add(new Line(vertex7, vertex8));
    sides.add(new Line(vertex7, vertex19));
    sides.add(new Line(vertex7, vertex20));
    sides.add(new Line(vertex8, vertex17));
    sides.add(new Line(vertex8, vertex18));
    sides.add(new Line(vertex9, vertex10));
    sides.add(new Line(vertex9, vertex13));
    sides.add(new Line(vertex9, vertex17));
    sides.add(new Line(vertex10, vertex14));
    sides.add(new Line(vertex10, vertex18));
    sides.add(new Line(vertex11, vertex12));
    sides.add(new Line(vertex11, vertex15));
    sides.add(new Line(vertex11, vertex19));
    sides.add(new Line(vertex12, vertex16));
    sides.add(new Line(vertex12, vertex20));

  }

  // call the draw function in Line class for every side of the dodecahedron
  void draw() {
    for (Line s : sides) {
      s.draw();
    }
  }
}
