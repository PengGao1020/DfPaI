
class Triangle {
  PVector pos;
  float rotation;

  Triangle(float x, float y) {
    pos = new PVector(x, y); // location of each triangle, getting values from main function
    rotation = 0;
  }

  void draw() {
    stroke(220, 0, 180);

    // draw triangles on the postions
    pushMatrix();
    translate(pos.x, pos.y);
    // set rotation based on the faceTowards function
    rotate(rotation+PI/2);
    scale(2, 2);
    triangle(-5, 2, 5, 2, 0, -10);
    popMatrix();
  }
  
  // calculate the angle of the new point get from main function and the position got before
  // set rotation angle
  void faceTowards(float x, float y) {
    float a = atan2(y-pos.y, x-pos.x);
    rotation=a;
  }
}

ArrayList<Triangle> friends = new ArrayList<Triangle>();

void setup() {
  size(500, 500);

  // set number of triangles on every row and column
  int N = 10;
  int spacing = width / (N + 1);
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      friends.add(new Triangle( i * spacing + spacing, j * spacing + spacing ));
    }
  }
}

void draw() {
  background(0);

  // draw triangles and set rotation based on the location of mouse
  for (Triangle t : friends) {
    t.faceTowards(mouseX, mouseY);
    t.draw();
  }
}
