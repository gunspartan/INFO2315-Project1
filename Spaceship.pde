class Spaceship {
  float x, y;
  float shipLength = 100;
  float shipHeight = 20;

  Spaceship(float x, float y) {
    // Set coordinates of spaceship
    this.x = x;
    this.y = y;
  }

  float getX() {
    return x;
  }
  float getY() {
    return y;
  }

  // Set x and y based on mouseX and mouseY
  void move(float mx, float my) {
    x = mx;
    y = my;
  }

  void display() {
    pushMatrix();
    fill(255);
    translate(x, y);
    // Ship body
    rect(0, -shipHeight/2, shipLength, shipHeight);
    // Change colour of ship parts
    fill(255, 36, 39);
    // Ship fins
    triangle(0, -shipHeight, 0, -shipHeight/2, 30, -shipHeight/2);
    triangle(0, shipHeight, 0, shipHeight/2, 30, shipHeight/2);
    popMatrix();
  }
}
