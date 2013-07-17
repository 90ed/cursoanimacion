import controlP5.*;

ParticleSystem ps;
PImage img;
ControlP5 control;
boolean activateBlending = false;

void setup() {
  size(800, 400, P2D);
  control = new ControlP5(this);
  control.addToggle("activateBlending").setPosition(10, 10).setSize(90,20).setLabel("ACTIVAR / DESACTIVAR");
  
  img = loadImage("texture.png");
  ps = new ParticleSystem(0, new PVector(width/2, 50));
  smooth();
}

void draw() {
  if(activateBlending){ blendMode(ADD); }
  background(#3a3a3a);
  ps.run();
  for (int i = 0; i < 1; i++) {
    ps.addParticle();
  }
}
