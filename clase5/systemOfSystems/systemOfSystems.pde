//ya hablamos un poquito de esto. Si necesitamos varios objetos y desconocemos su largo, o mejor dicho,
//su largo puede ser variable, nos resulta mas util ir con un ArrayList.
//ya utilizamos arraylist cuando utilizamos varias particulas. Ahora bien, en este caso, lo que necesitamos
//son varios SISTEMAS!. Asi que lo que vamos a agregar dentro del arrayList, son emitters:

ArrayList<Emitter> systems;

void setup() {
  size(800,200);
  systems = new ArrayList<Emitter>();
  smooth();
}

void draw() {
  background(0);
  for (Emitter ps: systems) {
    ps.run();
    ps.addParticle(); 
  }
}

//al cliquar, agregar un nuevo Emitter al arrayList sistems:

void mousePressed() {
  systems.add(new Emitter(1,new PVector(mouseX,mouseY)));
}
