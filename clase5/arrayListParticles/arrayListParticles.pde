ArrayList<Particle> particles;

void setup() {
  size(800,200);
  particles = new ArrayList<Particle>();
  particles.add(new Particle(new PVector(width/2,50)));
  smooth();
}

void draw() {
  background(255);
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
  particles.add(new Particle(new PVector(width/2,50)));
}




