import ddf.minim.*;
import ddf.minim.analysis.*;

ArrayList<Particle> particles;
boolean beatDetected;
Minim minim;
AudioPlayer song;
BeatDetect beat;

void setup() {
  size(800,200);
  particles = new ArrayList<Particle>();
  particles.add(new Particle(new PVector(width/2,50)));
  minim = new Minim(this);
  song = minim.loadFile("data/audio.mp3", 2048);
  song.play();
  beat = new BeatDetect();
  beatDetected = false;
  smooth();
}

void draw() {
  background(0);
  beat.detect(song.mix);
  if(beat.isOnset()){
    beatDetected = true;
  }else{
    beatDetected = false;
  }
  if(beatDetected){
    for(float i=0; i<20; i++){
      particles.add(new Particle(new PVector(width/2,50)));
    }
  }
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
}
