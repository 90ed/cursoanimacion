class Attractor {
  float mass;
  float G;
  PVector location;
  Boolean show = false;
  
  Attractor() {
    location = new PVector(width/2,height/2);
    mass = 20;
    G = 5;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float d = force.mag();
    d = constrain(d,5.0,25.0);
    
    //d = constrain(d,100,150);
    force.normalize();
    float strength = (G * mass * m.mass) / (d * d); 
    force.mult(strength);
    //force.mult(-1*strength);
    force.mult(-.05);
    return force;
  }

  void display() {
    ellipseMode(CENTER);
    if(show){
    strokeWeight(4);
    stroke(0);
    fill(175,200);
    ellipse(location.x,location.y,mass,mass);
    }
  }
}
