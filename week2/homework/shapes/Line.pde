class Line {
  PVector begin, end;
  int boxNum=10;
  ArrayList<Box> boxes=new ArrayList<Box>();
  float[] pos;
  float amt=0;


  Line(PVector begin, PVector end, float[] pos) {
    this. begin=begin;
    this. end=end;
    this.pos=pos;
    for (int i=0; i<boxNum; i++) {

      float x=lerp(begin.x, end.x, pos[i]);
      float y=lerp(begin.y, end.y, pos[i]);
      float z=lerp(begin.z, end.z, pos[i]);
      boxes.add(new Box(x, y, z));
    }
  }

  void draw() {

    for (int i=0; i<boxNum; i++) {
      Box b=boxes.get(i);
      float newAmt=(pos[i]+(i+1)*0.05*amt)%1;
      float newX=lerp(begin.x, end.x, newAmt);
      b.x=newX;
      b.draw();
      println(b.x);
    }
    
    println("          ");
    amt+=0.01; 
  }
}
