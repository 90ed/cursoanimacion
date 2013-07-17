// Simple Particle System
// Daniel Shiffman <http://www.shiffman.net>

// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float life;
  
  float mass = 1; // Let's do something better here!

  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    life = 255.0;
  }

  void run() {
    update();
    display();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    acceleration.add(f);
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    life -= 2.0;
  }

  // Method to display
  void display() {
    noStroke();
    fill(255,life);
    ellipse(location.x,location.y,12,12);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (life < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

