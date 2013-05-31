class Ball{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
 Ball(){
   xpos = random(width);
   ypos = random(height);
   xvel = 5;
   yvel =5;
  
 } 
 
 void update(){
   xpos += xvel;
   ypos += yvel;
   
 }
 
 void checkEdges(){
   if(xpos > width){
     xvel *= -1;
   }else if(xpos <0){
    xvel *= -1;
   }
   if(ypos > height){
       yvel *= -1; 
   }else if(ypos < 0){
      yvel *= -1;
   }
   
 }
 void render(){
    noStroke();
    fill(255);
    ellipse(xpos,ypos,10,10);
    fill(255,255,255,150);
    ellipse(xpos,ypos,30,30);
 }
  
}
