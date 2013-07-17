//el angulo de inicio
float angle = 0;
//angleVel para incrementar el angulo en el loop...
float angleVel = 0.1;

size(800,200);
background(0);
smooth();
stroke(100, 100, 100);
strokeWeight(2);
noFill();
beginShape();
for (int x = 0; x <= width; x += 5) {
  float y = map(sin(angle),-1,1,0,height);
  vertex(x,y);
  angle +=angleVel;
} 
endShape();

