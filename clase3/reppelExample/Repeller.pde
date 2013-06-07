class Repeller {

  float G = 50;
  int mass = 60;
  PVector location;
  float r = 10;
  Boolean show = false;


  Repeller(float x, float y)  {
    location = new PVector(x,y);
  }

  void display() {
    if(show){
      stroke(0);
      strokeWeight(2);
      fill(175);
      ellipse(location.x,location.y,80,80);
    }
  }
  
  //adivina que...
  //repelear es exactamente lo mismo que...atraer! :)
  //por lo tanto, para repelear hacemos exactamente lo mismo...peeero...peeero..
  //a la fuerza la multiplicamos por -1. Eso es todo.
  
  PVector repel(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,1.0,10000.0);
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(-1*strength);
    return force;
  }
}

