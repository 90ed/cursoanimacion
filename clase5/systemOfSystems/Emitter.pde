//la clase Emitter es igual a la que ya utilizamos. 
class Emitter {
  //el emitter tiene un ArrayList de particles
  ArrayList<Particle> particles;
  //y tiene un origen...
  PVector origin;
  
  Emitter(int num, PVector v) {
    particles = new ArrayList<Particle>();
    origin = v.get();
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));
    }
  }

  void run() {
    //iteramos las particulas...
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
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



