// Implements Craig Reynold's autonomous steering behaviors
//arrive
Vehicle v;

void setup() {
  size(800, 200);
  v = new Vehicle(width/2, height/2);
  smooth();
}

void draw() {
  background(255);
  //el target vuelve a ser el mouse...
  PVector mouse = new PVector(mouseX, mouseY);
  //y dibujamos algo para identificarlo...
  fill(200);
  stroke(0);
  strokeWeight(2);
  ellipse(mouse.x, mouse.y, 48, 48);
  //le pasamos el vector a la funcion arrive
  v.arrive(mouse);
  v.update();
  v.display();
}
