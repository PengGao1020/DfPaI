


size(256, 256);

loadPixels();

for (int x=0; x<width; x++) {
  for (int y=0; y<height; y++) {
    color col;
    int r, g, b, counter;
    counter=x+y*width;
    r=x;
    g=y;
    b=(x+y)/2;
    col=color(r, g, b);
    pixels[counter]=col;
    //println(r+" "+g+" "+b);
  }
}
// do something here!

updatePixels();
