class Mover {
  //posicion del objeto
  PVector location;
  //velocidad del objeto
  PVector velocity;
  //aceleracion del objeto
  PVector acceleration;
  //masa del objeto
  float mass;

  Mover() {
    //posicion inicial: x:30 y:30
    location = new PVector(30,30);
    //velocidad inicial en 0
    velocity = new PVector(0,0);
    //aceleracion inicial en 0
    acceleration = new PVector(0,0);
    //masa en 1 (ver diapos)
    mass = 1;
  }
  
  //funcion nueva.
  //applyForce(PVector force);
  //la funcion recibe como parametro una fuerza. ¿por qué asignamos una función?
  //porque de esta manera, podemos enviarle al objeto tantas fuerzas como necesitemos
  //o queramos. De esta forma, podemos modelar el viento, la gravedad, la fricción
  //y tantas otras fuerzas con una unica función. Veamos como funciona.
  
  void applyForce(PVector force) {
    //en la presentación dijimos que la fuerza la obteniamos de la 2da ley de Newton, que dice:
    
    //fuerza = masa x aceleracion.
    
    //pero a nosotros nos interesa la aceleración, que es lo que queremos aplicar!
    //entonces, despejamos aceleracion:
    
    //aceleracion = fuerza / masa.
    //¿que tul la siguiente linea?
    PVector a = PVector.div(force,mass);
    //una vez que obtuvimos la aceleracion a averiguar, se la aplicamos al vector
    //acceleration. ¿como? con el metodo add()
    acceleration.add(a);
  }
  
  //update()
  //y esto es lo que vimos la clase pasada, pero con un agregado.
  //a la velocidad, se la agrega la aceleración.
  //a la posición, se le agrega la velocidad.
  //pero finalmente, realizamos la operacion mult() sobre el vector de aceleration.
  //¿por qué se les ocurre que hacemos esto?
  //prueben quitando esa linea...
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(#FFFFFF);
    ellipse(location.x,location.y,20,20);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}



