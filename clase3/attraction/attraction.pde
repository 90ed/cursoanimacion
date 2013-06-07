//para tratar de hacerlo lo mas claro posible,
//vamos a utilizar dos objetos distintos...un Mover por un
//lado, y un attractor por otro. Se entiende lo que hara
//cada uno, verdad?

Mover m;
Attractor a;

//creamos los generals settings de la app, como siempre...
//y dentro del setup creamos las instancias de las clases
//Mover y Attractor. Las llamaremos m y a en nuestro codigo

void setup() {
  size(800,200);
  smooth();
  m = new Mover(); 
  a = new Attractor();
}

void draw() {
  background(255);

  //creamos una fuerza llamada force,
  //y obtenemos el valor de la misma a travesde una funcion
  //que se encuentra dentro del attractor.
  PVector force = a.attract(m);
  //esta fuerza que calculamos, se la aplicamos al mover
  //por medio de applyForce. ¿Se empieza a entender un poco
  //la lógica de por qué hicimos tanta intro a fuerzas?
  //ya conocemos esta función! :)
  m.applyForce(force);
  //actualizamos!
  m.update();
  
  a.display();
  m.display();
}




