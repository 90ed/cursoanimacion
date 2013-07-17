class Vehicle {
  //los 3 vectores de siempre!
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  //fuerza maxima
  float maxforce;
  //velocidad maxima
  float maxspeed;

  Vehicle(float x, float y) {
    //config inicial
    acceleration = new PVector(0,0);
    velocity = new PVector(0,-2);
    location = new PVector(x,y);
    r = 6;
    maxspeed = 1;
    maxforce = 0.05;
  }

  void update() {
    //lo de siempre...
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  //aplicamos la fuerza...pero miremos que es lo que llega!

  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
   void evade(Mover m){
    PVector distance = PVector.sub(m.location,location); 
    float T = distance.mag() / maxspeed;
    PVector velocityCopy = m.velocity.get();
    velocityCopy.mult(T);
    PVector futureLocation = PVector.add(m.location, velocityCopy);
    flee(futureLocation);
  }

  void flee(PVector target) {
    //vector entre el objeto y la locacion
    PVector desired = PVector.sub(target,location); 
    //si nosotros sabemos que desired es la velocidad deseada para que el objeto llego a destino...
    //en el caso de flee, no seria exactamente lo contrario?
    //asi es! y como invertimos este valor?
    //multiplicandolo por -1 :)
    desired.mult(-1);
    //lo normalizamos
    desired.normalize();
    //lo limitamos en su velocidad
    desired.mult(maxspeed);
    //ahora tenemos lo que necesitamos para crear la fuerza que el mismisimo Reynolds nos indica:
    PVector steer = PVector.sub(desired,velocity);
    //en funcion de como la limitamos, definimos la influencia de dicha fuerza
    steer.limit(maxforce);
    //y la aplicamos :)
    applyForce(steer);
  }
    
  void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
    
    
  }
}

