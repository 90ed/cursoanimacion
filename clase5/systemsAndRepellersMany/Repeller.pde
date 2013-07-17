class Repeller {
  //en vez de utilizar la G para la fuerza gravitaroria, la variable strength es mucho mas
  //representativa...
  float strength = 100; 
  PVector location;
  float r = 10;
  
  Repeller(float x, float y) {
    location = new PVector(x,y);
}

  void display() {
    noStroke();
    fill(100);
    ellipse(location.x,location.y,r*2,r*2);
  }

  PVector repel(Particle p) {
    PVector dir = PVector.sub(location,p.location);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d,5,100);
    float force = -1 * strength / (d * d);
    dir.mult(force);
    return dir;
  }  
}
