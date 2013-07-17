class Emitter {

  ArrayList<Particle> particles;
  PVector origin;
  PImage img;
  
  Emitter(int num, PVector v, PImage img_) {
    particles = new ArrayList<Particle>();
    origin = v.get();
    img = img_;
    particles.add(new Particle(origin, img)); 
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.dead()) {
        it.remove();
      }
    }
  }
  
  void applyForce(PVector dir) {
    for (Particle p: particles) {
      p.applyForce(dir);
    }  
  }  

  void addParticle() {
    particles.add(new Particle(origin,img));
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

}



