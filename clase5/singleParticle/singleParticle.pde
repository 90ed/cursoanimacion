//instancia de la clase Particle...la llamamos p
Particle p;

void setup() {
  size(800,200);
  //creamos la particula. Si nos fijamos en la clase
  //Particle, veremos que recibe como parametro un 
  //vector. Este vector indica la posicion inicial del objeto
  //(vector location)
  p = new Particle(new PVector(width/2,20));
  background(0);
  smooth();
}

void draw() {
  background(0);
  //corremos la particulita...
  p.update();
  p.display();
  //murio a particula que estabamos usando? 
  //si murio, creamos una nueva...
  if (p.isDead()) {
    p = new Particle(new PVector(width/2,20));
  }
}



