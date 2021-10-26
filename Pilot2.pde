class Pilot2 implements Pilot {
  float x;
  float y;

  void pilotXY(float mx, float my) {
    x = mx;
    y = my;
  }

  void display() {
    pushMatrix();
    pilotXY(mouseX, mouseY);
    fill(#FFFD98);
    translate(x, y);
    // Pilot2 will have a rectangluar head
    rect(35, -65, 40, 30);
    // Pilot body
    stroke(#FFFD98);
    strokeWeight(3);
    line(50, -50, 50, -10);
    line(50, -30, 65, -10);
    noStroke();
    popMatrix();
  }
}
