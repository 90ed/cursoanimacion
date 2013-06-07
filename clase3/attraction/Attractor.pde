class Attractor {
  //la masa del objeto...
  float mass;
  //la constante gravitacional...
  float G;
  //posicion del attractor. Es el unico vector
  //que vamos a utilizar, proque inicialmente lo vamos a dejar quieto.
  
  PVector location;
 
  //consturctor de la clase!
 
  Attractor() {
    //posicionamos el objeto
    location = new PVector(width/2,height/2);
    //le asignamos una masa
    mass = 10;
    //le asignamos un valor a la fuerza gravitatoria
    G = 10;
  }
  
  //y aca paciencia, que es donde la magia sucede...

  PVector attract(Mover m) {
    
    //1 - en primer lugar, obtenermos la distancia entre la posicón del attractor y la posición
    //del mover. ¿con qué laburamos? en ambos casos, con el vector location. Por un lado,
    //el vector location que tenemos en esta clase, y por otro, con el vector
    //location de m. (m.location).
    PVector F = PVector.sub(location,m.location);
    //una vez que tenemos el vector, le asignamos a la variable d la distancia entre ambos objetos.
    //¿recuerdan como lo haciamos? con la operación mag(), la cual nos devuelve la magnitud. Es decir,
    //la distancia entre dos objetos.
    float r = F.mag();
    // Limitintg the distance to eliminate "extreme" results for very close or very far objects
    //Constrains a value to not exceed a maximum and minimum value.
    //constrain lo que hace es limitar un valor para que no exeda un mínimo y un máximo. En este caso,
    //buscamos que el valor de d no sea mayor a 30, ni menor a 10.
    r = constrain(r,10,20);
    // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    //ahora normalizamos! por qué? porque la distancia no nos preocupa. Ya la calculamos. Ahora lo que necesitamos 
    //es obtener la dirección del vector...
    F.normalize();                                  
    // la super formula que nos devuelve la fuerza a aplicar...
    float strength = (G * mass * m.mass) / (r * r);
    // Get force vector --> magnitude * direction
    F.mult(strength);
    return F;
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
}


