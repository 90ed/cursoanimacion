//el angulo en el cual inicia
float startAngle = 0;
//la velocidad angular...
float angleVel = 0.23;

void setup() {
  size(800,200);
  smooth();
}

void draw() {
  background(0);
  //cada vez que dibujamos, incrementamos el valor de startAngle
  startAngle += 0.015;
  //y lo igualamos a angle...
  float angle = startAngle;
  //hacemos un for que arranca en 0, es menor o igual al largo de la pantalla, y
  //se va incrementando en 24
  for (int x = 0; x <= width; x += 24) {
    //sabemos que el seno de angle nos va a dar valores entre -1 y 1...
    //por lo tanto, lo mapeamos entre o y height
    float y = map(sin(angle),-1,1,0,height);
    fill(255,y/2);
    strokeWeight(2);
    ellipse(x,y,48,48);
    angle += angleVel;
  } 
}



