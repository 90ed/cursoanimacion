//importamos todas las clases que se encuentran
//dentro del package video

import processing.video.*;

Capture cam;              //instancia de la camara

void setup() {
  
  size(640, 480);
  String[] cameras = Capture.list();
  //si el largo del array camaras es 0...pues no hay camaras!
  if (cameras.length == 0) {
    println("opsss...no tenes camara instalada!");
    exit();
  } else {
    println("estas son las camarulis que tenes");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    //iniciamos la instancia...
    cam = new Capture(this, cameras[0]);
    //con el metodo .start() comienza la levantar los datos...
    cam.start();     
  }      
}

void draw() {
  //si esta disponible (lo averiguamos por medio del metodo 
  //avaiblable()
  if (cam.available() == true) {
    //leemos los datos (a traves del metodo read())
    cam.read();
  }
  //una forma de mostras la imagen es a traves de image
  image(cam, 0, 0);
  //la otra es a traves del metodo set:
  //set(0, 0, cam);
  //set() es mas rapido que image porque simplemente dibuja la data que se levanta
  //de la webcam. Ahora bien, si lo que queremos es aplicar transformaciones, modificaciones
  //escalas y demas, se lo tiene que hacer sobre la imagen...
}

