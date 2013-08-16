//instancia de la clase Vehicle. La vamos a llamar wanderer
Vehicle wanderer;
//una variable debug para dibujar las formas en las cuales este
//muchachito basa sus movimientos
boolean debug = true;

void setup() {
  size(740,200);
  //en el setup lo creamos y definimos el x e y que el objeto va a utilizar
  //como vector location
  wanderer = new Vehicle(width/2,height/2);
  //suaaave...
  smooth();
}

void draw() {
  //actualizar fondo. Si comentan esta linea van a obtener un dibujo que se vasa en el
  //recorrido que viene haciendo el wander
  background(255);
  //hacer los calculos para vagar
  wanderer.wander();
  //y luego, vagar.
  wanderer.run();
}

//si el mouse se presiona, alternamos el estado de debug, para dibujar o no las lineas...

void mousePressed() {
  debug = !debug;
}


