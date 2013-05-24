/**
** Ejemplo 2 :  random walker que pinta una imagen.
** by #90ED Media Art Studio. 
*/
PImage img;
float tester;
Walker w;


void setup() {
  size(800, 400);
  background(0);
  img = loadImage("background.png");
  w = new Walker();
}

void draw() {
  //image(img, 0, 0);
  color randomX = img.get(int(random(0, width)), int(random(0, height)));
  w.update();
  w.value = randomX;
  w.render();
}
