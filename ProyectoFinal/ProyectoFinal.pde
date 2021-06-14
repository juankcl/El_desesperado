//Imagen 2D
PImage img;
float cx, cy, hw, hh, txscale = 1.0;
PImage texture;
float mul = 0.1;
//3D
PShape s[] = new PShape[14];
float zoom = 150;

float delta = 0.0;
float lastMillis = 0.0;

float rotateX = 0;
float rotateY = 0;

float rotation = 90;
void setup() {
  size(800, 800, P3D);
  smooth(8); // Suavizar las líneas

  img = loadImage("desesperado.png"); //imagen 2D
  //textureMode(NORMAL);
  //textureWrap(REPEAT);

  hw = width * mul;
  hh = height *mul;
  cx = width *mul;
  cy = height *mul;
  texture = loadImage("desesperado.png");

  //Cargar objetos 3D
  s[0] = loadShape("Bed.obj");
  s[1] = loadShape("Board.obj");
  s[2] = loadShape("CeilingLamp.obj");
  s[3] = loadShape("Cup.obj");
  s[4] = loadShape("Desk.obj");
  s[5] = loadShape("Floor.obj");
  s[6] = loadShape("Lamp.obj");
  s[7] = loadShape("Laptop.obj");
  s[8] = loadShape("Outlet.obj");
  s[9] = loadShape("Poster.obj");
  s[10] = loadShape("Shelf.obj");
  s[11] = loadShape("Walls.obj");
  s[12] = loadShape("Window.obj");
  // Las luces van al final
  s[13] = loadShape("Lights.obj");

  perspective(PI/3.0, (float)width/height, 0.1, 100000.0);
  frameRate(1000);
}

void draw() {
  background(255);

  pushMatrix();
  translate(-100, 0, 100);
  rotateZ(radians(90));
  rotateX(radians(-90));
  image(img, 0, 0, width/10, height/10);
 
  popMatrix();

  dibujarEjes3D(50);
  //noFill();

  rotateX = mouseX;
  rotateY = mouseY;

  float coordX = zoom * cos(radians(rotation)) + 0;
  float coordY = zoom * sin(radians(rotation)) + 0;

  camera(coordX, coordY, 80, 0, 0, 50, 0, 0, -1);

  translate(0, 0, 0);
  scale(-1, 1, 1);
  scale(50);

  // Dibujar todo el fondo
  for (int i = 0; i < s.length; ++i) {
    shape(s[i], 0, 0);
  }

  delta = millis() - lastMillis;
  lastMillis = millis();

  // Poner los fps en el título
  surface.setTitle(str(frameRate));

  /* Usar delta para que la velocidad de vuelta no
   	cambie con la velocidad a la que se ejecuta el programa */
  rotation += 0.5 * (delta / 10);
}

void dibujarEjes3D(float dim) {
  // Eje X
  stroke(255, 0, 0, 255);
  line(0, 0, 0, dim, 0, 0);
  // Eje Y
  stroke(0, 255, 0, 255);
  line(0, 0, 0, 0, dim, 0);
  // Eje X
  stroke(0, 0, 255, 255);
  line(0, 0, 0, 0, 0, dim);
}



void mouseWheel(MouseEvent event) {
  zoom += event.getCount() * 2;
  println(zoom);
}
