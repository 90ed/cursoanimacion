//ParticleSystem, Emitter...a veces lo llamamos de una manera, a veces de otra,
//pero a fines practicos es lo mismo.
ParticleSystem ps;
//nuestro viejo amigo el repeller...
//repeller arrayList..
ArrayList<Repeller> repellers;


void setup() {
  size(800,200);
  smooth();
  ps = new ParticleSystem(new PVector(width/2,50));
  repellers = new ArrayList<Repeller>();
  repellers.add(new Repeller(width/2,105));
  repellers.add(new Repeller(width/2 + 60,150));
}

void draw() {
  background(0);
  ps.addParticle();
  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
  ps.applyRepellers(repellers);
  ps.run();
  for(Repeller rep:repellers){
    rep.display();
  }
}
