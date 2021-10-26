// Game
import java.util.*;

// Linked List of all levels
LinkedList<Level> levelsList = new LinkedList<Level>();
// Array list for all projectiles
ArrayList<Projectile> projectileList = new ArrayList<Projectile>();
// Array list for all aliens
ArrayList<Alien> alienList = new ArrayList<Alien>();

// Current Level
Level currLevel;

// Initalize Spaceship
Spaceship mySpaceship = new Spaceship(0, 0);

// Initialize Cannon
Cannon myCannon = new Cannon(0, 0);

// Bullet cooldown;
int bulletCooldown = 100;
int bulletLastFired;
// Missile cooldown
int missleCooldown = 1000;
int missileLastFired;

// Pilots
Pilot[] pilotList = {new Pilot1(), new Pilot2(), new Pilot3()};
// Default pilot
Pilot myPilot = pilotList[0];

void setup() {
  size(1280, 720);
  noStroke();

  // Generate levels
  for (int i = 0; i <= 17; i++) { //<>//
    levelsList.add(new Level(i + 1)); //<>//
  }

  // Set current level to first level
  currLevel = levelsList.remove(); //<>//
  // Generate aliens of first level
  createAliens(currLevel); //<>//
}


void draw() {
  background(#202020);

  // Check if there are more levels left in the game
  if (currLevel.getGameFinished()) { //<>//
    // Display game finished message
    pushMatrix();
    translate(width/2, height/2);
    textSize(48);
    textAlign(CENTER);
    fill(255);
    text("Game Finished!", 0, 0);
    popMatrix();
    textAlign(LEFT);
  }
  // Display the game as normal
  else { //<>//
    mySpaceship.move(mouseX, mouseY); //<>//
    myCannon.move(mouseX, mouseY); //<>//

    // Display all aliens
    for (int i = alienList.size() - 1; i >= 0; i--) { //<>//
      Alien alien = alienList.get(i); //<>//
      alien.moveAlien(); //<>//
      alien.display(); //<>//

      // Check if an alien has died
      if (alien.isDead()) { //<>//
        // Remove dead alien
        alienList.remove(i); //<>//
        // Check if the game should go to the next level
        nextLevel(); //<>//
      }
    }

    // Display all projectiles
    for (int i = projectileList.size() - 1; i >= 0; i--) { //<>//
      Projectile bullet = projectileList.get(i); //<>//
      bullet.fire(); //<>//
      bullet.display(); //<>//

      // Check if projectiles hit any aliens or went off screen
      if (bullet.getFinished() || collision(bullet)) { //<>//
        projectileList.remove(i); //<>//
      }
    }
    // Display everything else
    mySpaceship.display(); //<>//
    myPilot.display(); //<>//
    myCannon.display(); //<>//
  }
  // Display the current level
  currLevel.display(); //<>//
}

// Keyboard input
void keyPressed() { //<>//
  // Shoot a regular bullet //<>//
  // Only shoot if the cooldown is over
  if (key == 'w' && (millis() - bulletCooldown >= bulletLastFired)) { //<>//
    projectileList.add(new Bullet(mySpaceship.getX(), mySpaceship.getY(), 10, 5));
    bulletLastFired = millis();
  }
  // Shoot a missile
  // Only shoot if the cooldown is over
  if (key == 'e' && (millis() - missleCooldown >= missileLastFired)) { //<>//
    projectileList.add(new Missile(mySpaceship.getX(), mySpaceship.getY(), 9, 10));
    missileLastFired = millis();
  }

  // Change pilots based on input
  if (key == '1') { //<>//
    myPilot = pilotList[0];
  }
  if (key == '2') { //<>//
    myPilot = pilotList[1];
  }
  if (key == '3') { //<>//
    myPilot = pilotList[2];
  }
}

// Collision detection
Boolean collision(Projectile projectile) { //<>//
  Boolean collided = false;
  // Check every alien for a collision
  for (int i = alienList.size() - 1; i >= 0; i--) { //<>//
    if (projectile.getX() >= alienList.get(i).getX() // Compare x of projectile vs alien //<>//
      && (projectile.getY() >= alienList.get(i).getY() // Compare y of projectile vs alien above
      && projectile.getY() <= alienList.get(i).getY() + alienList.get(i).getSize())) { // Compare y of projectile vs alien below
      alienList.get(i).knockback(30);
      alienList.get(i).takeDamage(projectile.getDamage());
      collided = true; //<>//
    }
  }
  return collided; //<>//
}

// Create aliens
void createAliens(Level currLevel) { //<>//
  // Create Boss aliens every 5 levels
  if (currLevel.getLevel() % 5 == 0) { //<>//
    for (int numBosses = 1; numBosses <= currLevel.getLevel(); numBosses+=5) { //<>//
      alienList.add(new Boss (width + 25, random(height))); //<>//
    }
  }
  // Generate number of aliens based on level
  for (int j = 1; j <= currLevel.getLevel(); j++) { //<>//
    alienList.add(new Normal(width + 25, random(height))); //<>//
  }
}

// Check if the game should advance to the next level
void nextLevel() { //<>//
  // Check if there are more levels
  if (!levelsList.isEmpty()) { //<>//
    // Check if all aliens are dead
    if (alienList.isEmpty()) { //<>//
      // Advance to the next level
      currLevel = levelsList.remove(); //<>//
      createAliens(currLevel); //<>//
    }
  } else { //<>//
    // Game is finished when there are no more levels
    currLevel.setGameFinished(); //<>//
  }
}
