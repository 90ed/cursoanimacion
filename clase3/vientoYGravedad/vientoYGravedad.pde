//el objeto a animar
Mover m;

void setup() {
  size(800,200);
  smooth();
  //instancia del objeto
  m = new Mover();                           
  background(0,190,132);
}

void draw() {
  background(0,190,132);
  
  //fuerza a aplicar: viento, en el sentido de X
  PVector wind = new PVector(0.01,0);
  //fuerza a aplicar: gravedad, en el sentido de Y
  PVector gravity = new PVector(0,0.1);
  //aplicamos fuerza 1.
  m.applyForce(wind);
  //aplicamos fuerza 2
  m.applyForce(gravity);
  //actualizamos
  m.update();
  //mostramos
  m.display();
  //controlamos los boundaries
  m.checkEdges();
}
