class Pilot3 implements Pilot {
  float x;
  float y;

  void pilotXY(float mx, float my) {
    x = mx;
    y = my;
  }

  void display() {
    pushMatrix();
    pilotXY(mouseX, mouseY);
    fill(#43AA8B);
    translate(x, y);
    // Pilot3 will have a triangular head
    triangle(35, -65, 80, -35, 35, -35);
    // Pilot body
    stroke(#43AA8B);
    strokeWeight(3);
    line(50, -50, 50, -10);
    line(50, -30, 65, -10);
    noStroke();
    popMatrix();
  }
}
