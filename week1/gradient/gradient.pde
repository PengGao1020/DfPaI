


size(1000, 1000);

loadPixels();

for (int x=0; x<width; x++) {
  for (int y=0; y<height; y++) {
    color col;
    int r, g, b, counter;
    counter=x+y*width;
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
    col=color(r, g, b);
    pixels[counter]=col;
    //println(r+" "+g+" "+b);
  }
}
// do something here!

updatePixels();
