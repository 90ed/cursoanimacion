//array con todos los mooverrrss! :)
Mover[] movers = new Mover[600];
//el atractor. un unico attractor. quien se copa y arma un array de attractor
//y valida todos los movers con todos los attractors?
Attractor a;
//un repeller...no la podes creer eh...
Repeller r;
//una imagen, para ver un toque de blending y no laburar solo con ellipses.

PImage img;
//booleano para alternar la app...
Boolean showAttractor;

void setup() {
  size(800, 400);
  smooth();
  //la imagen la cargamos una sola vez!
  img = loadImage("texture.png");
  for (int i = 0; i < movers.length; i++) {
    //la imagen se la pasamos en el constructor...
     movers[i] = new Mover(random(3, 30), random(width), random(height), img);
  }
  a = new Attractor();
  r = new Repeller(250, 200);
}

void draw() {
  background(0);
  a.display();
  r.display();
  for (int i = 0; i < movers.length; i++) {
    
    //los moovers se atraen al attractor...
    
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
    
    //los movers se repelen del repeller...
    
    PVector rep = r.repel(movers[i]);
    movers[i].applyForce(rep);
    
    movers[i].update();
    movers[i].display();
  }
}

//presionen una tecla para alternar la visibilidad de las formas
//o una version un poco mas fuzzzzzy, chuuvvvi...

void keyPressed(){
  a.show = true;
  r.show = true;
  for (int i = 0; i < movers.length; i++) {
    movers[i].show = true;
  }
}

void keyReleased(){
  a.show = false;
  r.show = false;
  for (int i = 0; i < movers.length; i++) {
    movers[i].show = false;
  }
}
