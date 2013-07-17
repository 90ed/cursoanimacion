import controlP5.*;

Particle p;
ControlP5 control;
int lifeTime = 1;
int ellipseIncrement = 2;

void setup() {
  size(800, 200);
  control = new ControlP5(this);
  control.addSlider("lifeTime").setPosition(10,10).setRange(1,15);
  control.addSlider("ellipseIncrement").setPosition(10, 25).setRange(0.0, 5.0);
  control.loadProperties(("data/properties"));
  p = new Particle(new PVector(width/2, 20), lifeTime, ellipseIncrement);
  background(0);
  smooth();
}

void draw() {
  background(0);
  p.update();
  p.display();
  if (p.isDead()) {
    p = new Particle(new PVector(width/2, 20), lifeTime, ellipseIncrement);
  }
}

void exit(){
  control.saveProperties(("data/properties"));
  super.exit();
}
