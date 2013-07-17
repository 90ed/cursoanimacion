class Vehicle {
  
  //los 3 vectores de siempre  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  //la fuerza maxima para la steering force
  float maxforce;
  //la velocidad maxima a la que puede ir...
  float maxspeed;

  Vehicle(float x, float y) {
    //inicializamos los valores
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    r = 6;
    //recordemos que jugando con esto cambia el comportamiento!
    //maxspeed es que tan rapido puede ir
    maxspeed = 5;
    //maxforce es el limite que le aplicamos a la steering force.
    //a mayor limite, mas le cuesta girar
    maxforce = 0.1;
  }
  
  void update() {
    //la magia de siempre...
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
   }
  
  //esta funcion ya la recontra conocemos :)
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void arrive(PVector target) {
    //nosotros tenemos la velocidad del objeto, pero para calcular la steering force, necesitamos
    //la velocidad deseada. Esta la obtenemos con un sub entre el target y la posicion del objeto...
    PVector desired = PVector.sub(target,location);
    //guardamos en la variable d la magnitud del vector
    float d = desired.mag();
    //normalizamos la fuerza...
    desired.normalize();
    //si la magnitud (la distancia entre el target y el objeto) es menor a X valor, 100 en este caso,
    //mapeamos la velocidad maxima
    if (d < 100) {
      //creamos una variable m, y mapeamos d:
      //a medida que d se acerca a 0, maxspeed se acerca a 0...
      float m = map(d,0,100,0,maxspeed);
      //y si eso lo aplicamos a la velocidad deseada se va a ir deteniendo! :)
      desired.mult(m);
    } else {
        //si d es mayor a 100, todavia no esta cerca de llegar...por lo pronto, se sigue
       //dirigiendo al target en max speed... 
        desired.mult(maxspeed);
    }
    //obtenemos la steering force
    PVector steer = PVector.sub(desired,velocity);
    //la limitamos
    steer.limit(maxforce);
    //y la aplicamos :)
    applyForce(steer);
  }
  
  void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}

