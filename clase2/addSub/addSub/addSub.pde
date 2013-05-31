/**
** Vectores - Suma y Resta.
** by #90ED Media Art Studio. 
*/

String textoSuma = "La suma de los vectores es de: ";
String textoResta = "La resta de los vectores es de: ";

 PVector initPos = new PVector();
void setup(){
  size(800,600);
  background(0,190,132);
  initPos.x = width/2;
  initPos.y = height/2;
  smooth();
  
}

void draw(){
  background(0,190,132);
 
  PVector mousePos = new PVector(mouseX,mouseY);
  //Creamos un vector y con la funcion set() lo igualamos a mousePos.
  PVector vectorSum = new PVector();
  vectorSum.set(mousePos);
  //en Vector Sum almacenams la suma de los vectores.
  vectorSum.add(initPos);
  
  //Realizamos la resta de los vectores.
  //Sus valores se modifican al realizar la operacion add();
  // Si antes eran x:500 e Y:500 ahora seran 500-(WIDTH/2) y500-(HEIGHT/2);
  mousePos.sub(initPos);
  
  stroke(255);
  pushMatrix();
    translate(initPos.x,initPos.y);
    line(0,0,mousePos.x,mousePos.y);
  popMatrix();
  
  text("Los valores del vector MousePos son: x :" + mouseX + " y :"+ mouseY,10,10);
  text(textoSuma + " x :"+ vectorSum.x + " y: "+ vectorSum.y, 10 ,25);
  text(textoResta + "x : "+ mousePos.x + " y "+ mousePos.y,10,40);
  
  
  
}
