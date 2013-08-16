//dejamos esta variable por si vamos en modo debug...
boolean debug = true;

//el flow field en cuestion
FlowField flowfield;
//un ArrayList con todos los vehiculos a utilizar...
ArrayList<Vehicle> vehicles;

void setup() {
  size(800, 200);
  smooth();
  //el flow field! como parametro le pasamos el tamano de la grilla que vamos a crear...
  flowfield = new FlowField(10);
  //agregamos los objetitos al arraylist y a cada vehiculo le pasamos:
  //
  // - location (random x random y)
  // - maxspeed (random)
  // - maxforce (random)
  //
  
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 320; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5)));
  }
}

void draw() {
  background(255);
  //si estamos en debug, dibujamos lineas del flowfield
  if (debug) flowfield.display();
  //seguid y corred!
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }
}


void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

// Make a new flowfield
void mousePressed() {
  flowfield.init();
}



