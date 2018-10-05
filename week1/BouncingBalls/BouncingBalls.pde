Ball[] balls = new Ball[12];

void setup() {
  size(500, 500);

  for (int i = 0; i < balls.length; i++) {
    float radius = random(10, 20);
    float x = random(radius, width - radius);
    float y = random(radius, height - radius);
    balls[i] = new Ball(x, y, radius);
  }
}

void draw() {
  background(0);

  for (Ball b : balls) {
    for (Ball otherBalls : balls) {
      if (otherBalls!=b) {
        float d=dist(otherBalls.pos.x, otherBalls.pos.y, b.pos.x, b.pos.y);
        if ( d-2< b.radius+otherBalls.radius) {
          PVector bV=b.vel;
          PVector oV=otherBalls.vel;
          b.vel=oV;
          otherBalls.vel=bV;
        }
      }
    }
    b.draw();
    b.update();
  }
}
