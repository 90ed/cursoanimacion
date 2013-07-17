//va a quedar una estructura similar a la que utilizamos
//en ejemplos anteriores...solo que ahora el code esta
//dentro de la clase Emitter y no en la Main...
class Emitter {
  //arrayList con las particulas...
  ArrayList<Particle> particles;
  //nuestro emitter comienza a tener sentido:
  //utilizamos un vector, al cual denominamos origin, para
  //indicarle a las particulas donde es el punto de origen del emitter.
  //de esta manera, cuando mueren, saben donde tienen que resetearse
  //o volver a nacer...
  PVector origin;
  //instancia de emitter...
  Emitter(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  //agregar particulas!
  void addParticle() {
    particles.add(new Particle(origin));
  }
  //correr...
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
