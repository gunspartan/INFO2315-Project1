class Pilot1 implements Pilot {
  float x;
  float y;

  void pilotXY(float mx, float my) {
    x = mx;
    y = my;
  }

  void display() {
    pushMatrix();
    pilotXY(mouseX, mouseY);
    fill(#C37D92);
    translate(x, y);
    // Pilot1 will have a circle head
    ellipse(50, -50, 30, 30);
    // Pilot body
    stroke(#C37D92);
    strokeWeight(3);
    line(50, -50, 50, -10);
    line(50, -30, 65, -10);
    noStroke();
    popMatrix();
  }
}
