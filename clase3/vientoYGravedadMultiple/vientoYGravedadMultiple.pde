Mover[] movers = new Mover[20];

void setup() {
  background(0,190,132);
  size(800,200);
  smooth();
  //creamos todas las instancias. Para eso utilizamos
  //un array con 20 objetos (Mover)
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5,4),0,0); 
  }
}

void draw() {
  background(0,190,132);
  for (int i = 0; i < movers.length; i++) {
    //viento
    PVector wind = new PVector(0.01,0);
    //gravedad
    PVector gravity = new PVector(0,0.1);
    //aplicamos viento
    movers[i].applyForce(wind);
    //aplicamos gravedad
    movers[i].applyForce(gravity);
    //update!
    movers[i].update();
    //display
    movers[i].display();
    //los bordecitos...
    movers[i].checkEdges();
  }
}
