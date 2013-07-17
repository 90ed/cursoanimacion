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

  //cosa nueeeva. le aplicamos la fuerza a todas las particulas.
  //dentro de Repeller se encuentra la funcion repel, que es la que 
  //se encarga de ello...
  void applyRepeller(Repeller r) {
    for (Particle p: particles) {
      PVector force = r.repel(p);        
      p.applyForce(force);
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



