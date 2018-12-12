float edge=500; // side length of polyhedrons
float angle=0; // initial angle of rotation
float rotation=PI/180; // rotating rate

// polyhedron classes
Cube cub=new Cube(edge);
Octahedron oct=new Octahedron(edge);
Icosahedron ico=new Icosahedron(edge);
Dodecahedron  dod=new Dodecahedron(edge);
Tetrahedron  tet=new Tetrahedron(edge);

void setup() {
  size(500, 500, P3D);
  // set transparency for boxes
  noStroke();
  fill(250, 50);
  blendMode(ADD);
}

void draw() {
  background(30);
  // move the origin to the center
  translate(width / 2, height / 2, -500);
  // change the scale of shapes based on framecount
  // and use sin() to change them back and forth
  scale(sin(radians(frameCount)));
  // make the shapes rotating
  rotateX(angle);
  rotateY(angle);
  
  // use framecount to decide which shape is showing on the screen
  // for every 180 frame the scale of shape changes from 0 to 1 and back to 0 again
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
