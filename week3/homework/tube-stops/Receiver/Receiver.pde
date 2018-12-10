import oscP5.*;
import netP5.*;

OscP5 oscP5;

// use lat and lon of center london as the center to draw each station
float centerLat=51.5074;
float centerLon=0.1278;

// creat lists to receive data
FloatList lats=new FloatList();
FloatList lons=new FloatList();
StringList stations=new StringList();

void setup() {
  size(1000, 1000);

  // creat server on port 12000
  oscP5 = new OscP5(this, 12000);
}


void draw() {
  background(220);
  
  // background for the tube list on top
  pushMatrix();
  noStroke();
  fill(255);
  rect(0,0,width,615);
  popMatrix();
  
  // when data is received draw out stations
  if (lats!=null) {
    for (int i=0; i<lats.size(); i++) {
      float a=lons.get(i);
      float b=lats.get(i);
      String c=stations.get(i);

      // draw stations as a map with their own color
      float R=map(a, lons.min(), lons.max(), 0, 255);
      float G=map(b, lats.min(), lats.max(), 0, 255);
      float B=(R+G)%255;
      fill(R, G, B);
      ellipse(a, b, 5, 5);

      // draw all the stations on top of the map as a list
      ellipse(int(i/60)*200+10, (i%60*10)+10, 5, 5);
      text(c, int(i/60)*200+20, (i%60*10)+15);
    }
  }
}


void oscEvent(OscMessage theOscMessage) {

  // seperate the received data into different part
  float lat = theOscMessage.get(0).floatValue();
  float lon = theOscMessage.get(1).floatValue();
  String id = theOscMessage.get(2).stringValue();

  // modify the location data with lat and lon of center london 
  float x=width/2+(centerLon+lon)*1000+50;
  float y=height/2+(centerLat-lat)*1000+350;

  // add data into different lists
  lons.append(x);
  lats.append(y);
  stations.append(id);

  println(" lat: "+lat+" lon:" + lon +"   "+ id);
}
