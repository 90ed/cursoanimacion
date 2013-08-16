class FlowField {

  //un array multidimensional para el field!
  PVector[][] field;
  //la cantidad de filas y de columnas :) 
  int cols, rows;
  //el tamano de cada celda:
  int resolution;
  
  FlowField(int r) {
    //obtenemos la reso...
    resolution = r;
    //y sabiendola, armamos la grilla
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    init();
  }

  void init() {
    //si queremos resetear...
    //si bien esta parte es medio chino, lo que hace es calcular el flow field en funcion de un
    //perlin noise. Pueden hacer que sea lineal, o bien que sea random...
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI);
        field[i][j] = new PVector(cos(theta),sin(theta));
        yoff += 0.5;
      }
      xoff += 0.5;
    }
  }

  //si estamos en modo debug, dibujamos las lineas
  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*resolution,j*resolution,resolution-2);
      }
    }
  }

  //nada nuevo por aqui;. Se tiene que entender
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    translate(x,y);
    stroke(0,100);
    rotate(v.heading2D());
    float len = v.mag()*scayl;
    line(0,0,len,0);
    popMatrix();
  }
  
  //la funcion magica que devuelve el vector que nos interesa...

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].get();
  }


}





