
PImage input=loadImage("hand.jpg");
int step=10;

size(500, 500);

loadPixels();

for (int i=step; i<input.width; i+=step) {
  for (int j=step; j<input.height; j+=step) {
    int midPoint=i+j*input.width;
    float r=red(input.pixels[midPoint]);
    float g=green(input.pixels[midPoint]);
    float b=blue(input.pixels[midPoint]);
    noStroke();
    fill(r, g, b);
    rectMode(CENTER);
    rect(i, j, step*2, step*2);
  }
}
