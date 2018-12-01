class Box {
  float amt, vel;
  PVector loc;

  Box() {
    amt=random(1);
    vel=random(0.001,0.01);
  }

  void moving(PVector begin, PVector end) {
    float x=lerp(begin.x, end.x, amt);
    float y=lerp(begin.y, end.y, amt);
    float z=lerp(begin.z, end.z, amt);
    loc=new PVector(x,y,z);
    amt+=vel;
    amt=amt%1;
  }

  void draw() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    box(10);
    popMatrix();
  }
}
