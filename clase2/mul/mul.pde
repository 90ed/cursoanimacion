/**
** Vectores - Suma y Resta.
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
  background(0,190,132);
 
  PVector mousePos = new PVector(mouseX,mouseY);
  
  //Realizamos la resta de los vectores.
  //Sus valores se modifican al realizar la operacion add();
  // Si antes eran x:500 e Y:500 ahora seran 500-(WIDTH/2) y500-(HEIGHT/2);
  mousePos.sub(initPos);
  mousePos.mult(0.5);
  stroke(255);
  pushMatrix();
    translate(initPos.x,initPos.y);
    ellipse(0,0,5,5);
    line(0,0,mousePos.x,mousePos.y);
     ellipse(mousePos.x,mousePos.y, 5,5);
    mousePos.div(2);
    ellipse(mousePos.x,mousePos.y, 5,5);
  popMatrix();
  
  
  
  
}
