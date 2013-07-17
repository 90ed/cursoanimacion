class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;
  PImage tex;

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList();
    origin = v.get();
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));
    }
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

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}



