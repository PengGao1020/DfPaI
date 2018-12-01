float edge=500;
float angle=0;
float rotation=PI/180;

Cube cub=new Cube(edge);
Octahedron oct=new Octahedron(edge);
Icosahedron ico=new Icosahedron(edge);
Dodecahedron  dod=new Dodecahedron(edge);
Tetrahedron  tet=new Tetrahedron(edge);

void setup() {
  size(500, 500, P3D);
  noStroke();
  fill(250, 50);
  blendMode(ADD);
}

void draw() {
  background(30);
  translate(width / 2, height / 2, -500);
  scale(sin(radians(frameCount)));
  rotateX(angle);
  rotateY(angle);
  if (frameCount%900<180) {
    cub.draw();
  } else if (frameCount%900<360) {
    ico.draw();
  } else if (frameCount%900<540) {
    oct.draw();
  } else if (frameCount%900<720) {
    dod.draw();
  } else {
    tet.draw();
  }
  angle+=rotation;
}
