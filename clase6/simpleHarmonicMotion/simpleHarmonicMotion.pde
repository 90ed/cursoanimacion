//periodo es el tiempo que tarda en cumplirse un ciclo. Esta definido en FPS. Por lo pronto
//aca el periodo sera de 120 FPS. Equivale a 2 segundos
float period = 120;
//la amplitud es la distancia entre el centro de la animacion a un extremo. Por lo pronto,
//la oscilación será entre el centro y 5o pixeles hacia un lado, y 50 pixeles hacia el otro
float amplitude = 250;
  

void setup() {
  size(800,200);
}

void draw() {
  background(0);
  //la formula para calcula Simple Harmonic Motion
  float x = amplitude * cos(TWO_PI * frameCount / period);  
  noStroke();
  fill(127);
  translate(width/2,height/2);
  stroke(127);
  line(0,0,x,0);
  ellipse(x,0,48,48);
}
