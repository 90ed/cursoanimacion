//ParticleSystem, Emitter...a veces lo llamamos de una manera, a veces de otra,
//pero a fines practicos es lo mismo.
ParticleSystem ps;
//nuestro viejo amigo el repeller...
Repeller repeller;

void setup() {
  size(800,200);
  smooth();
  //nuevo sistema de particulas
  ps = new ParticleSystem(new PVector(width/2,50));
  //nuevo repeller
  repeller = new Repeller(width/2,105);
}

void draw() {
  background(0);
  //agregamos particulas...
  ps.addParticle();
  //creamos fuerza..
  PVector gravity = new PVector(0,0.1);
  //y se la pasamos al sistema...
  ps.applyForce(gravity);
  //aplicamos repeller al sistema
  ps.applyRepeller(repeller);
  repeller.display();
  ps.run();
}
