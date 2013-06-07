class Ball{
PVector location;
PVector velocity;
 Ball(){
   location = new PVector(random(width),random(height));
   velocity = new PVector(5,2);
  
 } 
 
 void update(){
   location.add(velocity);
   
 }
 
 void checkEdges(){
   if(location.x > width){
    velocity.x *= -1;
   }else if(location.x <0){
    velocity.x *= -1;
   }
   if(location.y > height){
       velocity.y *= -1; 
   }else if(location.y < 0){
     velocity.y *= -1;
   }
   
 }
 void render(){
    noStroke();
    fill(255);
    ellipse(location.x,location.y,10,10);
    fill(255,255,255,150);
    ellipse(location.x,location.y,30,30);
 }
  
}
