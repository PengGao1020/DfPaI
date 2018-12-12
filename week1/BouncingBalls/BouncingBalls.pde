Ball[] balls;
int ballNum=12; // set number of balls 
float maxVel=6; // set the maxium moving speed for each ball

void setup() {
  size(500, 500);

  // setup ball array and save balls into it
  balls = new Ball[ballNum];
  for (int i = 0; i < ballNum; i++) {
    float radius = random(10, 20);
    float x = random(radius, width - radius);
    float y = random(radius, height - radius);
    balls[i] = new Ball(x, y, radius, maxVel);
  }
}

void draw() {
  background(200);

  for (Ball b : balls) {
    // check every ball with others
    for (Ball otherBalls : balls) {
      // to make sure no self-comparison
      if (otherBalls!=b) {
        float d=dist(otherBalls.pos.x, otherBalls.pos.y, b.pos.x, b.pos.y);
        // set 2 pixels of buffer zone
        if ( d-2< b.radius+otherBalls.radius) {
          // calculate the angle and make balls bouncing off each other
          float angleX = otherBalls.pos.x - b.pos.x;
          float angleY = otherBalls.pos.y - b.pos.y;
          float angle = atan2(angleY, angleX);
          float targetX = b.pos.x + cos(angle) * (d-2);
          float targetY = b.pos.y + sin(angle) * (d-2);
          float newVx = (targetX - otherBalls.pos.x) ;
          float newVy = (targetY - otherBalls.pos.y) ;
          b.vel.x += newVx;
          b.vel.y += newVy;
          otherBalls.vel.x -= newVx;
          otherBalls.vel.y -= newVy;
        }
      }
    }
    // draw balls
    b.draw();
    b.update();
  }
}
