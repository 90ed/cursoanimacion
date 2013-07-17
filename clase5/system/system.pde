//antes aca mandabamos las particulas. Ahora, creamos un
//emitterr!!!
Emitter ps;

void setup() {
  size(800,200);
  smooth();
  //nueva instancia del emitter...
  ps = new Emitter(new PVector(100,60));
}

void draw() {
  background(0);
  //agregar particulas al emitter
  ps.addParticle();
  //correr el emitter
  ps.run();
  //en sintesis. TODO lo que esta sucediendo en la main, esta
  //vinculado a los emisores, y no a las particulas en si.
  //Las particulas como tales, las manejamos dentro
  //del emitter...
}
