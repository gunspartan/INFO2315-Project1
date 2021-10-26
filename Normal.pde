class Normal extends Alien {
  Normal (float x, float y) {
    super(x, y);
    health = 10;
    speed = 2;
    legHeight = 5;
    legLength = 15;
    bodyHeight = 20;
    bodyLength = 25;
    alienHeight = bodyHeight + (2 * legHeight);
  }

  // Normal Alien Movement
  void moveAlien() {
    x -= speed;
  }

  // Normal Alien
  void display() {
    pushMatrix();
    fill(#3a47fc);
    rect(x, y, legLength, legHeight);
    rect(x + 25, y, legLength, legHeight);
    rect(x + legLength/2, y + 5, bodyLength, bodyHeight);
    rect(x, y + 25, legLength, legHeight);
    rect(x + 25, y + 25, legLength, 5);
    popMatrix();
  }
}
