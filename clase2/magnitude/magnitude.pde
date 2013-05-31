/**
** Vectores - magnitud de un vector.
** by #90ED Media Art Studio. 
*/

PVector initPos = new PVector();
void setup(){
  size(800,600);
  background(0,190,132);
  initPos.x = width/2;
  initPos.y = height/2;
  smooth();
  
}

void draw(){
 
  PVector mousePos = new PVector(mouseX,mouseY);
  mousePos.sub(initPos);
  //Calculamos la magnitud del vector.
  float magnitud = mousePos.mag();
  //Aplicamos la magnitud al tamano de un rectangle.
  fill(0,190,132);
  noStroke();
  rect(0,0,width,10);
  fill(255);
  rect(0,0,magnitud,10);
  translate(initPos.x,initPos.y);
  stroke(255,255,255,(int)random(150));
  line(0,0,mousePos.x,mousePos.y);
  
  
  
}
