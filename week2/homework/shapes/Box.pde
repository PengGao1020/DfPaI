class Box {
  float x, y, z;

  Box(float _x, float _y, float _z) {
    x=_x;
    y=_y;
    z=_z;
  }
  void draw() {
    pushMatrix();
    translate(x, y, z);
    box(10);
    popMatrix();
  }
}
