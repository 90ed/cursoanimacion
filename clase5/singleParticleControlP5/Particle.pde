class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  //variable nueva. La llamamos life, y es para indicar cuanto
  //"tiempo de vida" queremos que tenga la particulita...
  float life;
  float lifeDecrement;

  Particle(PVector l, float lifeTime) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-1, 0));
    location = l.get();
    life = 255;
    //nueva variable! con que intervalo queremos que decremente la vida de la particula?
    lifeDecrement = lifeTime;
  }
  //actualizamos valores! lo de siempre: velocity agrega
  //acceleration, location agrega velocity, peeero...
  //tambien decrementamos el valor de la variable life
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    //antes life lo decrementabamos en 1. Ahora lo decrementamos en lifeValue. cuanto es lifeValue?
    //es lo que seteemos en el slider. Controlamos en real time la visualizacion!
    life -= lifeDecrement;
  }

  //mostramos :)
  void display() {
    stroke(0, life);
    strokeWeight(2);
    fill(255, life);
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

