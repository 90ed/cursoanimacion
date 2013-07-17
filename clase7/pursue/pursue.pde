// Implements Craig Reynold's autonomous steering behaviors
// One vehicle "seeks"
// See: http://www.red3d.com/cwr/

//movers, particles...ahora se llama vehicle!
Vehicle v;
//mira quien aparecio??
Mover m;


void setup() {
  size(800, 200);
  //lo posicionamos en el centro del escenario...
  v = new Vehicle(width/2, height/2);
  m = new Mover();
  smooth();
}

void draw() {
  background(255);
  //un vector al mouse
  PVector mouse = new PVector(mouseX, mouseY);
  fill(200);
  stroke(0);
  strokeWeight(2);
  v.pursue(m);
  v.update();
  v.display();
  m.update();
  m.display();
}

