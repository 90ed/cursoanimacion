class Walker{
   float x,y;
   float xnoise,ynoise;
   float time;
  
  Walker(float _x, float _y, float _time){
   x = _x;
   y = _y;
   time = _time;
   xnoise = random(1000);
   ynoise = random(1000);
   
  }
  void render(){
   noStroke();
   fill(255);
   ellipse(x,y,2,2);
  }
 
 void update(){
    x = map(noise(xnoise),0,1,0,width);
    y = map(noise(ynoise),0,1,0,height);
    xnoise += time;
    ynoise += time;
 } 
  
  
}
