//importamos las clasesilliasss...
import ddf.minim.*;
import ddf.minim.analysis.*;
//instancia de minim...
Minim minim;
//instancia del audio...
AudioPlayer song;
//instancia de la clase BeatDetect...
BeatDetect beat;
//una variable para modificar el radio del circulo...
float eRadius;
 
void setup()
{
  size(200, 200);
  //creamos instancia...
  minim = new Minim(this);
  //cargamos el audio
  song = minim.loadFile("data/audio.mp3", 2048);
  //y le damos play...
  song.play();
  //instancia de la clase beat...
  beat = new BeatDetect();
  eRadius = 20;
}
 
void draw()
{
  background(0);
  //detectamosss...
  beat.detect(song.mix);
  //mapeamosss...
  float a = map(eRadius, 20, 80, 60, 255);
  //coloreamossssssss....
  fill(255, 255, 255, a);
  //se dio un beat? isOnSet() devuelve true o false...
  //definimos el radio de 80
  if ( beat.isOnset() ) eRadius = 80;
  //dibujamos la ellipse...
  ellipse(width/2, height/2, eRadius, eRadius);
  //vamos decrementando el tamano...
  eRadius *= 0.95;
  //si es menor a 20, lo dejamos en 20..
  if ( eRadius < 20 ) eRadius = 20;
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}
