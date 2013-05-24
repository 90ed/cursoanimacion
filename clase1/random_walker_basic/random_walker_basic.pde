/**
** Ejemplo 2 : basic random walker.
** by #90ED Media Art Studio. 
*/

Walker walker;


void setup(){
  size(800,600);
  background(0,190,132);
  smooth();
  walker = new Walker();

}

void draw(){
  walker.update();
  walker.render();
 
}
