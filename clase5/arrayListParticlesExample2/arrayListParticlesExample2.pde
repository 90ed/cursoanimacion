ArrayList<Particle> particles;
boolean isPressed;

void setup() {
  size(800,200);
  particles = new ArrayList<Particle>();
  particles.add(new Particle(new PVector(width/2,50)));
  isPressed = false;
  smooth();
}

void draw() {
  background(0);
  if(isPressed){
    particles.add(new Particle(new PVector(width/2,50)));
  }
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
}

void mousePressed(){
  isPressed = true;
}

void mouseReleased(){
  isPressed = false;
}




