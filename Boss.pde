class Boss extends Alien {

  Boss (float x, float y) {
    super(x, y);
    health = 20;
    speed = 3;
    legHeight = 10;
    legLength = 30;
    bodyHeight = 40;
    bodyLength = 45;
    alienHeight = bodyHeight + (2 * legHeight);
  }

  // Boss Alien movement
  void moveAlien() {
    x -= speed;

    // Move up and down every second
    if (second() % 2 == 0) {
      y -= speed / 2;
    } else {
      y += speed / 2;
    }
  }

  // Boss Alien
  void display() {
    pushMatrix();
    fill(#11ff00);
    rect(x, y, legLength, legHeight);
    rect(x + 50, y, legLength, legHeight);
    rect(x + 15, y + 10, bodyLength, bodyHeight);
    rect(x, y + 50, legLength, legHeight);
    rect(x + 50, y + 50, legLength, legHeight);
    popMatrix();
  }
}
