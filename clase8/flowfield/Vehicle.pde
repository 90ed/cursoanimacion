//el muchachin!

class Vehicle {

  //esta es la data de siempre. Nada nuevo...
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
  
    Vehicle(PVector l, float ms, float mf) {
    location = l.get();
    r = 3.0;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
  }

  public void run() {
    update();
    borders();
    display();
  }

  //aca es donde pasa la magia...
  void follow(FlowField flow) {
    //lo realmente importante de este ejemplo: a velocidad deseada la 
    //calculamos dentro del FlowField
    PVector desired = flow.lookup(location);
    //limitamos
    desired.mult(maxspeed);
    //calculamos la steering force
    PVector steer = PVector.sub(desired, velocity);
    //limitamos
    steer.limit(maxforce);
    //aplicamos fuerza...
    applyForce(steer);
  }

  //la funcion de sieeeempre para aplicar fuerzas...
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //esto lo sabemos de memoria...
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  //dibujamos el vehiculin...
  
  void display() {
    float theta = velocity.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }

   //chequeamos los bordes
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}


