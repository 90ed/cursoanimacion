class Mover {
  
  //oops! :) esta clase es exactamente igual a la clase mover con la que veniamos laburando! :)
  //no cambia nada.
  //el objeto tiene posicion, velocidad, aceleracion  masa.
  //también tiene una función applyForce que lo que hace es...aplicar la fuerza!
  //¿que fuerza?
  //la fuerza gravitatoria que calculamos
  //¿donde la calculamos?
  //dentro del attractor
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(400,0);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    mass = 10;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x,location.y,16,16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }

  }

}



