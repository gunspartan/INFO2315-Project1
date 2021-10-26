abstract class Alien {
  float x, y, health, speed;
  float alienHeight;
  float legHeight;
  float legLength;
  float bodyHeight;
  float bodyLength;

  Alien (float x, float y) {
    this.x = x;
    this.y = y;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getHealth() {
    return health;
  }

  float getSize() {
    return alienHeight;
  }

  // Alien moves towards the left of screen
  abstract void moveAlien();
  // void moveAlien() {
  //   x += speed;
  // }

  // Alien is knocked back when hit by projectile
  void knockback(float distance) {
    x += distance;
  }

  void takeDamage(float damage) {
    health -= damage;
  }

  // Alien is dead if health is 0
  boolean isDead() {
    if (health <= 0) {
      return true;
    } else {
      return false;
    }
  }
  
  abstract void display();
}
