class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  //variable nueva. La llamamos life, y es para indicar cuanto
  //"tiempo de vida" queremos que tenga la particulita...
  float life;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-1, 0));
    location = l.get();
    //asignamos el valor a la variable life
    life = 255.0;
  }
  //actualizamos valores! lo de siempre: velocity agrega
  //acceleration, location agrega velocity, peeero...
  //tambien decrementamos el valor de la variable life
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    life -= 1.0;
  }

  //mostramos :)
  void display() {
    stroke(0, life);
    strokeWeight(2);
    fill(127, life);
    ellipse(location.x, location.y, 12, 12);
  }

  //esta funcion devuelve un booleano y la necesitamos para
  //saber si la particula sigue con vida. como sabemos 
  //si sigue con vida? sigue con vida si el valor de life
  //es mayot a 0.
  boolean isDead() {
    if (life < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

