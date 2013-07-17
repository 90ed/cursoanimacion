//Hola Mover! de nuevo por aqui...
Mover mover;

void setup() {
  size(800,200);
  smooth();
  //creamos un nuevo mover :)
  mover = new Mover(); 
}

void draw() {
  background(0);
  //lo de siempre. update, check, display
  mover.update();
  mover.checkEdges();
  mover.display(); 
}


