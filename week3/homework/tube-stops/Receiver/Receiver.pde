import oscP5.*;
import netP5.*;


OscP5 oscP5;


float centerLat=51.5074;
float centerLon=0.1278;

FloatList lats=new FloatList();
FloatList lons=new FloatList();
StringList stations=new StringList();

void setup() {
  size(1000, 1000);
  oscP5 = new OscP5(this, 12000);

}


void draw() {
  background(220);
  if (lats!=null) {
    for (int i=0; i<lats.size(); i++) {
      float a=lons.get(i);
      float b=lats.get(i);
      String c=stations.get(i);
      float R=map(a,lons.min(),lons.max(),0,255);
      float G=map(b,lats.min(),lats.max(),0,255);
      float B=(R+G)%255;
      fill(R, G, B);
      ellipse(a, b, 5, 5);
      ellipse(int(i/60)*200+10,(i%60*10)+10,5,5);
      text(c,int(i/60)*200+20,(i%60*10)+15); 
    }
  }
}


void oscEvent(OscMessage theOscMessage) {

  float lat = theOscMessage.get(0).floatValue();
  float lon = theOscMessage.get(1).floatValue();
  String id = theOscMessage.get(2).stringValue();
  float x=width/2+(centerLon+lon)*1000+50;
  float y=height/2+(lat-centerLat)*1000+250;
 
  lons.append(x);
  lats.append(y);
  stations.append(id);

  println(" lat: "+lat+" lon:" + lon +"   "+ id);
}
