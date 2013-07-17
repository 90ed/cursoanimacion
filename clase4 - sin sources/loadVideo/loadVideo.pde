//importamos clase de video..
import processing.video.*;
//creamos instancia de la clase Movie
Movie myMovie;
float movieVelocity = 1;

void setup() {
  size(720, 450);
  //frameRate(30);
  myMovie = new Movie(this, "video.mov");
  //si queremos que loopee:
  myMovie.loop();
  //en caso de que algo este loopeando, se lo puede detener con:
  //myMovie.noLoop();
}

void draw() {
  background(255);
  //mientras haya datos, leerlos...
  if (myMovie.available()) {
    myMovie.read();
  }
  image(myMovie, 0, 0);
  //la duracion total del video
  //float md = myMovie.duration();
  //el tiempo actual del video
  //float mt = myMovie.time();
  //println("duration: " + md + " - time: " + mt); 
}

void mousePressed() {
  //con pause se pausa el video
  myMovie.pause();
}

void mouseReleased() {
  //con play se lo reanuda...
  myMovie.play();
}

void keyPressed(){
  if(key == ' '){
    //stop frena la reprod del video y manda el cabezal de lectura a 0.
    myMovie.stop();
  }else if(keyCode == UP){
    //jump manda el cabezal de lectura a donde se lo indiquemos. En este caso hacemos un random
    //de la duracion del video. Por lo tanto, ira a cualquier frame al presionar la tecla UP
    myMovie.jump(random(myMovie.duration()));
  }else if(keyCode == LEFT){
    movieVelocity -= .1;
    myMovie.speed(movieVelocity);
  }else if(keyCode == RIGHT){
    movieVelocity += .1;
    myMovie.speed(movieVelocity);
    
  }
}

