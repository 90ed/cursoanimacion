//importamos la libreria de audio
import ddf.minim.*;
//creamos la instancia...
Minim minim;
//instancia de audio...
AudioPlayer song;
 
void setup()
{
  size(100, 100);
  //inicializamos minim...
  minim = new Minim(this);
  //cargamos el archivito...
  song = minim.loadFile("data/audio.mp3");
  //le damos play
  song.play();
}

void draw()
{
  //background(0);
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

void mousePressed(){
  song.pause();
}
 

void mouseReleased(){
  song.play();
}
