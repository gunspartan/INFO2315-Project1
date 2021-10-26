class Level {
  int levelNum;
  Boolean gameFinished = false;

  Level (int levelNum) {
    this.levelNum = levelNum;
  }

  int getLevel() {
    return levelNum;
  }

  Boolean getGameFinished() {
    return gameFinished;
  }


  void setGameFinished() {
    gameFinished = true;
  }


  void display() {
    textSize(18);
    fill(255);
    // Display Current Level
    pushMatrix();
    translate(10, 24);
    text("Level: " + levelNum, 0, 0);
    popMatrix();
  }
}
