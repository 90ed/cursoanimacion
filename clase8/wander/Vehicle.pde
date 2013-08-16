//clase Vehicle. Es la que hace todos los calculos y demas. Veamosla paso a paso

class Vehicle {

  //los tres vectores de siempre: location, velocity y acceleration
 
  PVector location;
  PVector velocity;
  PVector acceleration;
 
 //r:
 
  float r;
  
  //es el angulo en base al cual vamos a calcular la animacion
  
  float wandertheta;
  
  //fuerza maxima a aplicar
  
  float maxforce;
  
  //velocidad maxima a aplicar
  
  float maxspeed;

  Vehicle(float x, float y) {
    
    //inicializamos las variables. Presetenle atencion que al de location le asignamos
    //la posicion en x e y que le pasamos desde el constructor. Este vehiculo arranca
    //en el centro del escenario, pero lo pueden tirar por donde quieran. Incluso, pueden
    //crear varios de estos y tirarlos en distintas posiciones...
    
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    
    //el tamano del muneco
    
    r = 5;
    
    //el angulo con el cual vamos a laburar, lo inicializamos en 0
    
    wandertheta = 0;
    
    //ojo con la velocidad. La definimos en 2, pero hay algo importante en esto: la manera
    //en la cual creamos y asignamos todas las variables que entran en juego, definen en su
    //conjunto lo que va a pasar con la animacion. Lograr un movimiento piola depende en gran
    //medida de utilizar distintos valores de manera apropiada, tanto para fuerza, distancia,
    //velocidad, etc.
    
    maxspeed = 1;
    
    //idem con esta variable: cuanto menor sea el valor de maxforce, mas le va a costar
    //al objeto ir hacia el target. A mayor numero, mucho mas rapida e inmediata la reaccion
    
    maxforce = 0.05;
  }

  //organizamos todo en tres funciones, que as ejecutamos desde el metodo run();
  // - update() actualiza los vectores
  // - borders() controla que cuando se va por un lado, aparezca por otro
  // - display() dibuja al objeto en la posicion que le corresponda

  void run() {
    update();
    borders();
    display();
  }

  //la movidilla de siempre:
  //a la velocidad, le agregamos la aceleracion
  //a la velocidad, la limitamos a maxspeed
  //a la posicion, le agregamos la velocidad
  //a la aceleracion, la reseteamos
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  //aca es donde pasa la magia y las cosas interesantes y nuevas. Veamos paso a paso:

  void wander() {
    
    //wanderR es el radio para saber dentro de que espacio se genera el wander.
    
    float wanderR = 40;
    
    //distancia en pixeles desde nuestro vehiculo al centro del wander circle
    
    float wanderD = 120;
    
    //change define el "intervalo" con el cual queremos que se produzcan los saltos
    //a menor numero, se mantiene mas estatico, por lo pronto, tiene menos cambio.
    //a mayor numero, mayor aleatoriedad en el salto, por lo pronto, mayor cambio
    
    float change = 0.01;
    
    //wandertheta dijimos que es el angulo que incrementamos constantemente.
    //en cuanto lo incrementamos?
    //en un random posible a calcular entre -change y change.
    
    wandertheta += random(-change,change);

    //esta parte suena a chino, pero vamos a ver que no lo es. Necesitamos saber en que lugar
    //posiconar el circulo dentro del cual calculamos las posicionas. Y lo que recordamos de la diapo es que
    //el mismo se encuentra en una posicion determinada que se encuentra a X distancia en direccion
    //a la velocidad. Por lo pronto, comenzamos creando un vector e igualandolo al vector de velocidad:
    
    PVector circleloc = velocity.get();
    
    //una  vez que lo tenemos, lo normalizamos. ¿por qué? porque no nos interesa la velocidad en sí, sino
    //su dirección.
    
    circleloc.normalize();
    
    //una vez normalizado, tenemos que agregarle la distancia a la cual se va a encontrar. ¿dónde hicimos eso?
    //lo hicimos anteriormente, con la variable wanderD (la distancia entre el vehículo y el círculo en el cual
    //hacemos los calculos
    
    circleloc.mult(wanderD);
    
    //hasta aca esta todo genial, pero, ¿qué nos está faltando? a la posicion del circulo, le tenemos
    //que agregar la posicion del vehiculo:
    
    circleloc.add(location);
    
    //creamos una variable y por medio de heading2D() (atan2) averiguamos hacia donde esdta apuntando
    //la cosa. Sino no vamos a saber hacia donde rotarlo...
    
    float h = velocity.heading2D();
    
    //circleOffSet es el punto sobre la circunferencia que queremos averiguar:
    //la posicion en x es:
    //    - wanderR multiplicado el coseno del angulo actual, mas el angulo del vehiculo (h)
    //la posicion en y es:
    //    - wanderR multiplicado el seno del angulo actual, mas el angulo del vehiculo...
    
    PVector circleOffSet = new PVector(wanderR*cos(wandertheta+h),wanderR*sin(wandertheta+h));
    
    //joder. Llegamos hasta aca y nadie se fue. Eso es bueno. Hicimos todos los calculos, ahora bien, 
    //lo ultimo que nos queda por hacer, es definir el target. El target es el objeto al cual el vehiculo
    //apunta. ¿cómo lo obtenemos? sencillo...creamos un nuevo vector, lo llamamos target, y al mismo
    //le agregamos la posicion del circulo (circleloc)mas la posicion de X punto sobre el circulo (circleOffset)
    
    PVector target = PVector.add(circleloc,circleOffSet);
    
    //a la funcion seek() le pasamos el target...
    
    seek(target);
    
    //y si estamos en modo debug, mandamos a hacer las lineas y toda la porqueria

    if (debug) drawWanderStuff(location,circleloc,target,wanderR);
  }  

  //esto ya lo vimos...lo repasamos en clase!
  
  void seek(PVector target) {
    
    //desired es un vector que apunta desde la posicion de nuestro vehiculo al target...
    
    PVector desired = PVector.sub(target,location);
    
    //ya la obtuvimos? genial. ahora la normalizamos...
    
    desired.normalize();
    
    //la multiplicamos por maxspeed...
    
    desired.mult(maxspeed);
    
    //dijimos que una steering force es la velocidad deseada menos la velocidad actual. Por lo pronto:
   
    PVector steer = PVector.sub(desired,velocity);
    
    //la limitamos a maxforce para que no se vaya al demonio..
    
    steer.limit(maxforce);
    
    //tenemos la fuerza :) la aplicamos!

    applyForce(steer);
  }
  
  //aca la aplicamos. Atenti: si bien a fines practicos lo que estamos haciendo aca carece de sentido 
  //tranquilamente podriamos hacer acceleration.add(steer) y no andar llamando a una funcion, el real 
  //objetivo de esto es que recuerden que este esquema lo venimos manteniendo desde hace un rato largo 
  //(primeras clases!) donde hacemos siempre lo mismo:
  
  //1 - calculamos fuerza
  //2 - se la agregamos a la aceleracion
  //3 - la aceleracion se la agregamos a la velocidad
  //4 - la velocidad se la agregamos a la posicion del objeto
  //
  //en las primeras clases la fuerza era un valor predefinido. En este caso, estamos haciendo
  //algunos calculos para obtenerla y hacer uso de ella :)
  
    void applyForce(PVector force) {
      acceleration.add(force);
  }
  

  //un poquito de dibujo en Processing.

  void display() {
    float theta = velocity.heading2D() + radians(90);
    fill(127);
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }

  //check para los bordes...
  
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}


//en caso de estar en modo debug, aca hacemos todos los dibujines...

void drawWanderStuff(PVector location, PVector circle, PVector target, float rad) {
  stroke(0); 
  noFill();
  ellipseMode(CENTER);
  ellipse(circle.x,circle.y,rad*2,rad*2);
  ellipse(target.x,target.y,4,4);
  line(location.x,location.y,circle.x,circle.y);
  line(circle.x,circle.y,target.x,target.y);
}

