class Tetrahedron {
  ArrayList<Line> sides=new ArrayList<Line>();
  float halfLen;
  float inter;

  Tetrahedron(float len) {
    halfLen=len/2;
    inter=halfLen/sqrt(2);

    PVector vertex1=new PVector (-halfLen, 0, -inter);
    PVector vertex2=new PVector (halfLen, 0, -inter);
    PVector vertex3=new PVector (0,halfLen,inter );
    PVector vertex4=new PVector (0,-halfLen,inter);


    sides.add(new Line(vertex1, vertex2));
    sides.add(new Line(vertex1, vertex3));
    sides.add(new Line(vertex1, vertex4));
    sides.add(new Line(vertex2, vertex3));
    sides.add(new Line(vertex2, vertex4));
    sides.add(new Line(vertex3, vertex4));
   
  }

  void draw() {
    for (Line s : sides) {
      s.draw();
    }
  }
}
