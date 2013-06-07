class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  PImage img;
  Boolean show;
  
  Mover(float m, float x, float y, PImage _img) {
    mass = m;
    location = new PVector(random(width), random(height));
    velocity = new PVector(1, 0);
    acceleration = new PVector(0, 0);
    img = _img;
    show = false;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
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
    fill(0,100);
    if(!show){
      imageMode(CENTER); 
      tint(255);
      image(img,location.x, location.y, mass, mass);
   }else{
     fill(#ffffff);
     ellipse(location.x, location.y, mass, mass);
   }
  }
}
