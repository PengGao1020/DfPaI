import processing.video.*;

PImage background;
PImage replace;
Capture capture;
float threshold=15;

void setup() {
  size(640, 480);

  capture = new Capture(this, width, height);
  capture.start();
  replace=loadImage("Background.jpg");
}

void draw() {
  if (capture.available()) {
    capture.read();

    if (background != null) {

      loadPixels();

      // set the pixels here!
      capture.loadPixels();
      background.loadPixels();

      for (int x = 0; x < capture.width; x ++ ) {
        for (int y = 0; y < capture.height; y ++ ) {
          int loc = x + y*capture.width; 
          color fgColor = capture.pixels[loc]; 
          color bgColor = background.pixels[loc];
          color rpColor = replace.pixels[loc];

          float r1 = red(fgColor);
          float g1 = green(fgColor);
          float b1 = blue(fgColor);
          float r2 = red(bgColor);
          float g2 = green(bgColor);
          float b2 = blue(bgColor);
          float change = dist(r1, g1, b1, r2, g2, b2);

          if (change > threshold) {
            pixels[loc] = fgColor;
          } else {
            pixels[loc] = rpColor;
          }
        }
      }
      updatePixels();
    } else {
      image(capture, 0, 0);
    }
  }
}

void keyPressed() {
  background = capture.copy();
}
