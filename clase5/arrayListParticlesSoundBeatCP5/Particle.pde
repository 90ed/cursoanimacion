class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float life;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
    life = 255.0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    life -= 3.0;
  }

  void display() {
    noStroke();
    fill(255, life);
    ellipse(location.x, location.y, 12, 12);
  }

  boolean isDead() {
    if (life < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

