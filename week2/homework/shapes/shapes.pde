PVector beginLine, endLine;
Line lines;
int boxNum=10;
float[] pos=new float[boxNum];

void setup() {
  size(500, 500, P3D);
  noStroke();
  fill(250, 50);
  blendMode(ADD);
  //frameRate(1);
   for (int i=0; i<boxNum; i++) {
      pos[i]=random(1);
    }
  beginLine=new PVector(0, height/2, 0);
  endLine=new PVector(width, height/2, 0);
  lines=new Line(beginLine, endLine,pos);
}

void draw() {
  background(30);
  lines.draw();
  
}
