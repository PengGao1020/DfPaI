import peasy.*;

Table table;
PeasyCam cam;
float moonRadius = 1737.1; // in km

ArrayList<MoonCraters> moonCraters=new ArrayList<MoonCraters>();

float lat, lon, dia;

void setup() {
  size(1280, 1280, P3D);
  stroke(255);
  noFill();

  // set camera location and load csv data file
  cam = new PeasyCam(this, 4000);
  table = loadTable("moon_crater_coords.csv", "header");

  // add new crater into the arraylist for every row of data
  for (int i = 0; i < table.getRowCount(); i++) {
    lat = table.getFloat(i, "lat");
    lon = table.getFloat(i, "lon");
    dia = table.getFloat(i, "dia");
    moonCraters.add(new MoonCraters(lat, lon, dia, moonRadius));
  }
  //println(moonCraters.size());
}

void draw() {
  background(0);

  //draw cirles on the moon
  for (MoonCraters c : moonCraters) {
    c.draw();
  }
}
