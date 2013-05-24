/**
** Ejemplo 2 : Pitagoras basico.
** Temas: Trigonometria.
** by #90ED Media Art Studio. 
*/

void setup(){
  size(800,600);
  background(0,190,132);
   smooth();
  
}

void draw(){
   background(0,190,132);
   stroke(255);
   fill(255);
   
   ellipse(width/2,height/2,50,50);
   
   ellipse(mouseX,mouseY,50,50);
   strokeWeight(2);
   line(width/2,height/2,mouseX,mouseY);
   
   
}
