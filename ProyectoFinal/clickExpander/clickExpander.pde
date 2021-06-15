PImage desImg;

void setup() {
  size(1000, 1000);
  desImg = loadImage("desesperado.png"); //imagen 2D
} 

void draw() {
  float scale = 1.0/12.0;
  background(204);
  if (mousePressed == true) {
    fill(255); // White
    image(desImg, 
      -(desImg.width * scale) / 2.0, -(desImg.height * scale) / 2.0, // Poner su origen en el centro
      desImg.width * scale, desImg.height * scale); // Poner el tamaño de la imagen escalada
  } else {
    fill(0); // Black
  }
  rect(25, 25, 50, 50);
}
