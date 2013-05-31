/**
** Animacion 1 en 1.
** by #90ED Media Art Studio. 
*/

Ball ball = new Ball();

void setup(){
  size(800,600);
  background(0,190,132);
  smooth();
  
}

void draw(){
  background(0,190,132);
 
  ball.update();
  ball.checkEdges();
  ball.render();
}
