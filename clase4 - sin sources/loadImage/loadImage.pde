PImage webImg;

void setup() {
  size(1024, 1024);
  String url = "image.jpg";
  webImg = loadImage(url);
}

void draw() {
  background(0);
  image(webImg, 0, 0);
}
