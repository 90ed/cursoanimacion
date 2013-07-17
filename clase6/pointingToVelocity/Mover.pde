class Mover {

  //los vectores con los que venimos desde el comienzo del curso: location, velocity, acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  //topSpeed. Recuerdan el metodo limit() de los vectores? vamos a hacer que la aceleracion
  //pueda llegar a un limite pero que no se vaya de mambo...
  float topSpeed;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topSpeed = 5;
  }

  void update() {

    //creamos un vector que se encuentra en la posicion del mouse
    PVector mouse = new PVector(mouseX, mouseY);
    //creamos un vector llamado dir, que es la resta entre la posicion del mouse
    //y la posicion del objeto
    PVector dir = PVector.sub(mouse, location);
    //lo normalizamos, para obtener un vector unitario: de 1...es decir, solamente tenemos
    //a donde esta apunrando
    dir.normalize();
    //lo multiplicamos por .5 para acelerarlo: 1 x .5
    dir.mult(0.5);
    //hacemos que dir sea la aceleracion
    acceleration = dir;
    //la aceleracion se le agrega a la velocidad
    velocity.add(acceleration);
    //la velocidad la limitamos, para que no crezca a mas de topSpeed
    velocity.limit(topSpeed);
    //a location le agregamos la velocidad...
    location.add(velocity);
  }

  void display() {
    //theta. Generalmente utilizamos este nombre de variable cuando necesitamos laburar
   //con angulos. hablemos algo de heading2D 
    float theta = velocity.heading2D();
    noStroke();
    fill(127);
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    //rotamos en theta
    rotate(theta);
    rect(0, 0, 30, 10);
    popMatrix();
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } 
    else if (location.y < 0) {
      location.y = height;
    }
  }
}


