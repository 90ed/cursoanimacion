/**
** Uso de Arrays y clases.
** by #90ED Media Art Studio. 
*/
ArrayList walkers;
int maxWalkers = 100;
int currentWalkers = 0;

void setup(){
  size(800,600);
  background(0,190,132);
  smooth();
  walkers = new ArrayList(); // Creamos un arraylist vacio
}

void draw(){
  for(int i = 0; i < walkers.size(); i++){
    Walker w = (Walker) walkers.get(i);
    w.update();
    w.render();
  }
}
void mouseClicked(){
  walkers.add(new Walker(random(width),random(height), random(0.02)));   
}
