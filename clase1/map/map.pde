/**
** Ejemplo 2 : funcion map().
** by #90ED Media Art Studio. 
*/

int maxHeight = 200;
int maxWidth = 500;
void setup(){
  size(800,600);
  background(0,190,132);
   smooth();
  
}

void draw(){
  //noFill();
  stroke(255);
   background(0,190,132);
  fill(255);
  float rectWidth = map( mouseX,0,width,0,maxWidth);
  float rectHeight = map(mouseY,0,height,0,maxHeight);
  rect(width/2 - rectWidth/2,height/2 - rectHeight/2, rectWidth, rectHeight); 
  
}
