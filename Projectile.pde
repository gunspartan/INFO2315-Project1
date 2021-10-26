abstract class Projectile extends Cannon {
  float speed;
  float damage;
  float projectileSize;
  boolean isFinished = false;

  Projectile(float x, float y, float speed, float damage) {
    // Off set x to start at tip of cannon
    super(x + 180, y);
    this.speed = speed;
    this.damage = damage;
  }

  float getSize() {
    return projectileSize;
  }

  float getDamage() {
    return damage;
  }

  // Move towards the right when fired
  void fire() {
    x += speed;
  }

  Boolean getFinished() {
    return isFinished;
  }

  // Projectile is finished once it is off the screen
  void finished() {
    if (this.x > width) {
      isFinished = true;
    }
  }

  abstract void display();
}
