// Implements Craig Reynold's autonomous steering behaviors
// One vehicle "seeks"
// See: http://www.red3d.com/cwr/

//movers, particles...ahora se llama vehicle!
Vehicle v;

void setup() {
  size(800, 200);
  //lo posicionamos en el centro del escenario...
  v = new Vehicle(width/2, height/2);
  smooth();
}

void draw() {
  background(255);
  //un vector al mouse
  PVector mouse = new PVector(mouseX, mouseY);
  fill(200);
  stroke(0);
  strokeWeight(2);
  //y dibujamos una elipse...
  ellipse(mouse.x, mouse.y, 48, 48);
  //comportamiento...flee!
  v.flee(mouse);
  //update
  v.update();
  //mostrar
  v.display();
}

