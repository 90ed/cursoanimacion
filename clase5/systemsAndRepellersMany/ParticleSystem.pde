class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }

  void applyRepellers(ArrayList r) {
    for (Particle p: particles) {
      Iterator<Repeller> it = r.iterator();
      while (it.hasNext()) {
        Repeller actualRepeller = it.next();
        PVector force = actualRepeller.repel(p);        
        p.applyForce(force);
      }
    }
  }


  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}



