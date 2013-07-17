//--------------------------------------------------------
//necesitamos minim para laburar con el input del audio...

import ddf.minim.*;

Emitter ps;
Random generator;
Minim minim;
AudioInput in;

void setup() {
  size(383,200);
  //esta vez no levantamos un audio. Simplemente creamos un
  //line in, y se lo asignamos a la variable in.
  //el resto se mantiene igual...
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  generator = new Random();
  PImage img = loadImage("texture.png");
  ps = new Emitter(0,new PVector(width/2,height-25),img);
  smooth();
}

void draw() {
  print(in.mix.level() + " - \n");
  background(0);
  //in.mix.level() nos devuelve el nivel de intensidad
  //entre 0 y 1 (a mi me tira entre 0 y 0.4 a todo trapo)
  //peeero...como vimos en la primer clase, tenemos la opcion
  //mapear valores con map()
  //map(valorAMapear, minimIn, MaximoIn, minimoOut, MaximoOut);
  float dx = map(in.mix.level(), 0.0, 0.3, -0.1, 01);
  //le asignamos el valor del mapeo al vector
  PVector wind = new PVector(dx,0);
  //y luego le aplicamos la fuerza:
  ps.applyForce(wind);
  ps.run();
  ps.addParticle();
}

 
void stop()
{in.close();
  minim.stop();
  super.stop();
}
