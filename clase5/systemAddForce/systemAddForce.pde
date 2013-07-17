Emitter ps;
Random generator;

void setup() {
  size(383,200);
  generator = new Random();
  PImage img = loadImage("texture.png");
  ps = new Emitter(0,new PVector(width/2,height-25),img);
  smooth();
}

void draw() {
  background(0);
  float dx = map(mouseX,0,width,-0.1,0.1);
  PVector wind = new PVector(dx,0);
  //le mandamos la fuerza al emitter
  ps.applyForce(wind);
  ps.run();
  ps.addParticle();
}
