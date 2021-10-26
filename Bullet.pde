class Bullet extends Projectile {
  Bullet(float x, float y, float speed, float damage) {
    super(x, y, speed, damage);
    this.projectileSize = 15;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    fill(#D7F75B);
    // Bullet
    ellipse(0, 0, projectileSize, projectileSize/2);
    popMatrix();
  }
}
