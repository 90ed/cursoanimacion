class Walker{
   float x,y;
   color value;
  Walker(){
   x = width/2;
   y = height/2;
   
   
  }
  void render(){
   noStroke();
   fill(value);
   ellipse(x,y,2,2);
  }
 
 void update(){
    int choice = int(random(4));
    
    if(choice ==0){
      x++; 
    }else if(choice ==1){
      x--; 
    }else if(choice ==2){
      y++; 
    }else{
      y--; 
    }
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
 } 
  
  
}
