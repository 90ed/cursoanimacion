/**
** Uso de Arrays y clases.
** by #90ED Media Art Studio. 
*/
Walker[] walkers = new Walker[10];



void setup(){
  size(800,600);
  background(0,190,132);
  smooth();
  for(int i = 0; i < walkers.length ; i++){
    walkers[i] = new Walker(); 
  }

}

void draw(){
  for(int i = 0; i < walkers.length; i++){
    walkers[i].update();
    walkers[i].render(); 
  }

}
