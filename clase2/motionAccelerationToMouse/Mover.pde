class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 10;
  }

  void update() {
    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);
    acceleration.normalize();
    acceleration.mult(.5);
    
    //el ABC de la animacion:
    //primero se labura la aceleracion
    //a la velocidad se le agrega la aceleracion
    //se limita la velocidad de ser necesario
    //a la locacion se la agrega la velocidad
    
    velocity.add(acceleration);
    print(velocity);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x,location.y,10,10);
  }
}



