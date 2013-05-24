class Walker{
   float x,y;
   float xnoise,ynoise;
  
  Walker(){
   x = width/2;
   y = height/2;
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
    
    xnoise += 0.01;
    ynoise += 0.01;
 } 
  
  
}
