class Cannon extends Spaceship {
  float cannonLength = 50;
  float cannonWidth = 15;

  Cannon (float x, float y) {
    super(x, y);
  }

  void display() {
    pushMatrix();
    fill(153, 36, 255);
    translate(x, y);
    // Cannon
    rect(100, -cannonWidth/2, cannonLength, cannonWidth);
    rect(100 + cannonLength, -cannonWidth/4, 30, cannonWidth/2);
    popMatrix();
  }
}
