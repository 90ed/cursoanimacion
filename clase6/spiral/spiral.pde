//recordemos: que necesitamos para laburar en sistema polar?
//la magnitud (r) y el angulo (theta).
//los inicializamos en 0

float r = 0;
float theta = 0;

void setup() {
  size(750,200);
  background(255);
  smooth();
}

void draw() {
  //pasamos de sistema polar a cartesiano. En el ejemplo anterior tienen
  //un comment un poco mas detallado de lo que hacemos aca...
  float x = r * cos(theta);
  float y = r * sin(theta);
  noStroke();
  fill(0);
  //que necesitamos para hacer un espira?
  //si incrementamos solamente el angulo, las posiciones X e Y no se van a ir modificando
  //pero para que se genere un espiral, tenemos que hacer que dichas coordenadas, tambien
  //se vayan alejando. como lo hacemos?  incrementando la magnitud!
  //cual es la magnitud? la variable R. 
  
  ellipse(x+width/2, y+height/2, 1, 1); 
  //incremento del angulo
  theta += 0.1;
  //incremento de la magnitud
  r += 0.05;
}
