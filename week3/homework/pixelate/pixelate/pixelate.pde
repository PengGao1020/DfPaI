
PImage input=loadImage("hand.jpg");

// set step for the size of grid
int step=10;

size(500, 500);

loadPixels();

// change linear pixel array to grid
for (int i=step; i<input.width; i+=step) {
  for (int j=step; j<input.height; j+=step) {
    int midPoint=i+j*input.width;

    // load RBG value for each grid
    float r=red(input.pixels[midPoint]);
    float g=green(input.pixels[midPoint]);
    float b=blue(input.pixels[midPoint]);

    // fill each grid with color of the midpoint
    noStroke();
    fill(r, g, b);
    rectMode(CENTER);
    rect(i, j, step*2, step*2);
  }
}
