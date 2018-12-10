import processing.video.*;

PImage background;
PImage replace;
Capture capture;

// set threshold of difference between captured image from camera
float threshold=15;

void setup() {
  size(640, 480);

  // open the camera and start loading images
  capture = new Capture(this, width, height);
  capture.start();
  replace=loadImage("Background.jpg");
}

void draw() {

  if (capture.available()) {
    capture.read();

    // when camera is running and background is captured start the comparision
    if (background != null) {

      loadPixels();

      // set the pixels here!
      capture.loadPixels();
      background.loadPixels();

      // compare every pixel in saved background image and new captured image
      for (int x = 0; x < capture.width; x ++ ) {
        for (int y = 0; y < capture.height; y ++ ) {
          int loc = x + y*capture.width; 
          color fgColor = capture.pixels[loc]; 
          color bgColor = background.pixels[loc];
          color rpColor = replace.pixels[loc];

          // calculate the RBG value difference between two image
          float r1 = red(fgColor);
          float g1 = green(fgColor);
          float b1 = blue(fgColor);
          float r2 = red(bgColor);
          float g2 = green(bgColor);
          float b2 = blue(bgColor);
          float change = dist(r1, g1, b1, r2, g2, b2);

          // seperate the background and moving figure based on the threshold value
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

  // when key pressed save captured image as background
  background = capture.copy();
}
