class Ball {
  PVector pos, vel;
  float radius, maxVel;
  color col;


  Ball(float x, float y, float radius) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
    this. radius = radius;
    col= color(random(255), random(255), random(255));
    maxVel=6;
  }

  void update() {


    pos.add(vel);

    if (pos.x < radius || pos.x >width - radius) {
      vel.x *= -1;
    }
    if (pos.y < radius || pos.y > height - radius) {
      vel.y *= -1;
    }


    if (mousePressed) {
      PVector newVel= new PVector(mouseX - pos.x, mouseY-pos.y);
      newVel.normalize();
      newVel.mult(random(0.1, 1));
      vel.add(newVel);
      vel.limit(maxVel);
    }
  }

  void draw() {
    fill(col);
    ellipse(pos.x, pos.y, radius * 2, radius*2);
  }

}
