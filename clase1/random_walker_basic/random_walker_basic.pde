/**
** Ejemplo 2 : basic random walker.
** by #90ED Media Art Studio. 
*/

Walker walker;
Walker walker2;
Walker walker3;
Walker walker4;

void setup(){
  size(800,600);
  background(0,190,132);
  smooth();
  walker = new Walker();
  walker2 = new Walker();
  walker3 = new Walker();
  walker4 = new Walker();
}

void draw(){
  walker.update();
  walker2.update();
  walker3.update();
  walker4.update();
  walker.render();
  walker2.render();
  walker3.render();
  walker4.render();
}
