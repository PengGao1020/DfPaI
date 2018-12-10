class Ball {
  PVector pos, vel;
  float radius, maxVel;
  color col;

  Ball(float x, float y, float radius, float max) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
    this. radius = radius;
    col= color(random(255), random(255), random(255), 125);
    maxVel=max;
  }

  void update() {

    // balls start moving
    pos.add(vel);

    // setup boundaries for balls 
    if (pos.x < radius || pos.x >width - radius) {
      vel.x *= -1;
    }
    if (pos.y < radius || pos.y > height - radius) {
      vel.y *= -1;
    }

    // when mouse pressed all balls moving toward mouse's location
    if (mousePressed) {
      PVector newVel= new PVector(mouseX - pos.x, mouseY-pos.y);
      newVel.normalize();
      newVel.mult(random(0.1, 1));
      vel.add(newVel);
    }
    
    // limit speed of balls
    vel.limit(maxVel);
  }

  // draw balls
  void draw() {
    fill(col);
    ellipse(pos.x, pos.y, radius * 2, radius*2);
  }
}
