import controlP5.*;

//instancia de la clase Particle...la llamamos p
Particle p;
//controlcete para modificar el tiempo de vida de la particula 
ControlP5 control;
//el valor inicial...
int lifeTime = 1;

void setup() {
  size(800, 200);
  control = new ControlP5(this);
  control.addSlider("lifeTime").setPosition(10,10).setRange(1,15);
  //creamos la particula. Si nos fijamos en la clase
  //Particle, veremos que recibe como parametro un 
  //vector. Este vector indica la posicion inicial del objeto
  //(vector location)
  p = new Particle(new PVector(width/2, 20), lifeTime);
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
    p = new Particle(new PVector(width/2, 20), lifeTime);
  }
}


