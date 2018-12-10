class MoonCraters {

  float lat, lon, dia;  
  float radius;
  float x, y, z; 

  MoonCraters(float _lat, float _lon, float _dia, float _radius) {
    // get craters' location and diameter data, and moon radius
    lat=radians(_lat);
    lon=radians(_lon);
    dia=_dia;
    radius=_radius;

    // change location data to x,y,z coordinate
    x=radius*cos(lat)*sin(lon);
    y=radius*cos(lat)*cos(lon);
    z=radius*sin(lat);
  }

  void draw() {
    // draw circle at the x,y,z location
    pushMatrix();
    translate(x, y, z);

    // rotate the circle facing the center of moon
    rotateZ(HALF_PI-lon);
    rotateY(HALF_PI-lat);
    //box(20);
    ellipse(0, 0, dia, dia);
    popMatrix();
  }
}
