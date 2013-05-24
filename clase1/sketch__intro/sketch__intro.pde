/**
** Ejemplo 1 : Manejo basico de processing.
** Temas: Sistema de coordenadas. Funciones de Processing y Funciones custom.
** by #90ED Media Art Studio. 
*/

void setup(){
  size(800,600);
  background(0,190,132);
   smooth();
  
}

void draw(){
  //Definimos el color
  fill(255);
  //Seteamos que no tenga borde
  noStroke();
  //Dibujamos una ellipse
  ellipse(width/2,height/2,50,50);
  //Definimos un borde blanco
  stroke(255);
  // Quitamos el relleno
  noFill();
  //Dibujamos un cuadrado
  rect(width/3,height/2 - 25,50,50);
  //Dibujamos un triangulo
  int x1 = width - width/3;
  int y1 = height/2 - 25;
  int x2 = x1 + 25;
  int y2 = y1 + 50;
  int x3 = x1 - 25;
  int y3 = y2;
  //Funcion de processing para dibujar triangulos
  triangle(x1,y1,x2,y2,x3,y3);
  //Llamamos una funcion propia
  strokeWeight(5);
  drawLine(width/3, height/2 + 50 , x2, height/2 + 50);
  
}


// funcion custom
void drawLine(float x1,float y1, float x2, float y2){
  //Funcion propia de processing para manejo de lineas
  line(x1,y1,x2,y2);
  //println() permite imprimir valores de la misma forma que lo hace el trace() de Flash.
  println("Nuestra linea mide: " + (x2 - x1) + "de ancho.");
  
}
