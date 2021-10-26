class Missile extends Projectile {
  Missile(float x, float y, float speed, float damage) {
    super(x, y, speed, damage);
    this.projectileSize = 30;
  }


  void display() {
    pushMatrix();
    translate(x, y);
    fill(#f30606);
    // Missile
    rect(0, 0, projectileSize, projectileSize/4);
    popMatrix();
  }
}
