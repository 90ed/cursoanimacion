/**
 * convertimos de polar (r,theta) a cartesiano (x,y):  
 * x = r * cos(theta)
 * y = r * sin(theta)
 */
 
float r;
float theta;

void setup() {
  size(800, 200);
  smooth();
  
  //definimos los valores iniciales...
  //el radio
  r = 50;
  //e angulo
  theta = 0;
}

void draw() {
  background(0);
  //nos movemos al centro de la pantalla
  translate(width/2, height/2);
  //aqui es donde la magic happens
  //repasamos:
  
  
  //SOH      - S = 0 / H            -  S = y / r        - despejo y:    y = r * sin(theta)
  //CAH      - C = A / H            -  c = x / r        / despejo x     x = r * cos(theta)
  
  
  //recordemos que theta arranca en 0.
  
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  ellipseMode(CENTER);
  fill(127);
  stroke(0);
  strokeWeight(2);
  line(0,0,x,y);
  ellipse(x, y, 48, 48);
  //incrementamos el angulo en el tiempo...
  theta += 0.05;
  

}




