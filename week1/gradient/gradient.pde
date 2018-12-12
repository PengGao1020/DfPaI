
size(1000, 1000);

loadPixels(); // load pixel array to work with

// use two for loops to transfer the linear pixel array into 2D grid
for (int x=0; x<width; x++) {
  for (int y=0; y<height; y++) {
    color col;
    int r, g, b, counter;
    
    // call number of the pixel array
    counter=x+y*width;
    
    // use module to constrain color range between 0-255 
    // and reverse color changing when it over 255 or smaller than 0  
    if (x/256%2==0 && y/256%2==0) {
      r=x-x/256*256;
      g=y-y/256*256;
    } else if (x/256%2==1 && y/256%2==0) {
      r=256-x%256;
      g=y-y/256*256;
    } else if (x/256%2==0 && y/256%2==1) {
      r=x-x/256*256;
      g=256-y%256;
    } else {
      r=256-x%256;
      g=256-y%256;
    }
    b=150;
    
    //save color into pixels
    col=color(r, g, b);
    pixels[counter]=col;
    //println(r+" "+g+" "+b);
  }
}

// show the changed pixels
updatePixels();
