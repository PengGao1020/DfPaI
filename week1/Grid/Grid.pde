int r=40;
int gridNum;
int gap=10;
int u=r+gap;

void setup() {
  size(1000, 1000);
  gridNum=width/2/u;
}

//set up grid of position to draw "emojis"
void draw() {
  background(255);
  for (int i=0; i<gridNum; i++) {
    for (int j=0; j<gridNum; j++) {
      // draw jokers on the boundaries
      // and deadpool inside, open and close eyes arranged alternately
      if (i==0||j==0||i==gridNum-1||j==gridNum-1) {
        joker(i*2*u+u, j*2*u+u);
      } else if ((i%2==0 && j%2==0)||(i%2==1 && j%2==1)) {
        deadPoolA(i*2*u+u, j*2*u+u);
      } else {
        deadPoolB(i*2*u+u, j*2*u+u);
      }
    }
  }
}

// sorry for the endless drawing, just trying to get more familiar with coordinate.

// draw open eye deadpool on a giving position
void deadPoolA(int x, int y) {
  int centerX=x;
  int centerY=y;

  fill(0);
  noStroke();
  ellipse(centerX, centerY, 2*r, 2*r);
  fill(255, 0, 0);
  ellipse(centerX, centerY, 9*r/5, 9*r/5);

  pushMatrix();
  translate(centerX-r/2, centerY-r/15);
  fill(0);
  rotate(PI/20);
  ellipse(0, 0, 7*r/8, 7*r/6);
  popMatrix();

  pushMatrix();
  translate(centerX+r/2, centerY-r/15);
  fill(0);
  rotate(-PI/20);
  ellipse(0, 0, 7*r/8, 7*r/6);
  popMatrix();

  fill(255);
  ellipse(centerX-r/2, centerY-r/30, 4*r/9, 2*r/3);
  ellipse(centerX+r/2, centerY-r/30, 4*r/9, 2*r/3);
}

// draw close eye deadpool on a giving position
void deadPoolB(int x, int y) {
  int centerX=x;
  int centerY=y;

  fill(0);
  noStroke();
  ellipse(centerX, centerY, 2*r, 2*r);
  fill(255, 0, 0);
  ellipse(centerX, centerY, 9*r/5, 9*r/5);

  pushMatrix();
  translate(centerX-r/2, centerY);
  fill(0);
  rotate(-PI/20);
  ellipse(0, 0, 7*r/8, 7*r/6);
  popMatrix();

  pushMatrix();
  translate(centerX+r/2, centerY);
  fill(0);
  rotate(PI/20);
  ellipse(0, 0, 7*r/8, 7*r/6);
  popMatrix();

  fill(255);
  triangle(centerX-r/4, centerY+r/5, centerX-5*r/8, centerY+r/8, centerX-7*r/9, centerY-r/6);
  triangle(centerX+r/4, centerY+r/5, centerX+5*r/8, centerY+r/8, centerX+7*r/9, centerY-r/6);
}

// draw joker on a giving position
void joker(int x, int y) {
  int centerX=x;
  int centerY=y;

  noStroke();

  hair(centerX, centerY);

  fill(0);
  ellipse(centerX, centerY, 17*r/8, 17*r/8);
  fill(240, 240, 220);
  ellipse(centerX, centerY, 2*r, 2*r);

  mouth(centerX, centerY);

  fill(200, 0, 0);
  ellipse(centerX, centerY+r/4, r/4, r/4);

  pushMatrix();
  translate(centerX-2*r/5, centerY-r/4);
  eye();
  popMatrix();

  pushMatrix();
  translate(centerX+2*r/5, centerY-r/4);
  eye();
  popMatrix();
}

// draw mouth for joker
void mouth(int x, int y) {
  int centerX=x;
  int centerY=y;
  noStroke();
  fill(170, 0, 0);
  arc(centerX, centerY, 5*r/3, 5*r/3, PI/10, 9*PI/10, OPEN);
  fill(0);
  arc(centerX, centerY, 3*r/2, 3*r/2, PI/10, 9*PI/10, OPEN);
  fill(170, 0, 0);
  arc(centerX, centerY, 7*r/4, 5*r/4, PI/10, 9*PI/10, OPEN);
  fill(240, 240, 220);
  arc(centerX, centerY, 11*r/6, r, PI/10, 9*PI/10, OPEN);
}

// draw eyes for joker
void eye() {
  fill(0, 0, 150);
  ellipse(0, 0, r/2, r);
  fill(255);
  ellipse(0, 0, 3*r/8, 7*r/8);
  fill(0);
  ellipse(0, 0, r/8, r/2);
}

// draw hair for joker
void hair(int x, int y) {
  int centerX=x;
  int centerY=y;
  fill(0, 150, 0);
  ellipse(centerX-sin(PI/6)*r, centerY-cos(PI/6)*r, r/3, r/3);
  ellipse(centerX-sin(PI/4)*r, centerY-cos(PI/4)*r, r/2, r/2);
  ellipse(centerX-sin(PI/3)*r, centerY-cos(PI/3)*r, r/3, r/3);

  ellipse(centerX+cos(PI/6)*r, centerY-sin(PI/6)*r, r/3, r/3);
  ellipse(centerX+cos(PI/4)*r, centerY-sin(PI/4)*r, r/2, r/2);
  ellipse(centerX+cos(PI/3)*r, centerY-sin(PI/3)*r, r/3, r/3);
}
