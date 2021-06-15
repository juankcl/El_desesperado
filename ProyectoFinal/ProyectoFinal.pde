//Imagen 2D
PImage desImg;
PGraphics pg;
float inter = 0;
float interY= 0;
//3D
PShape s[] = new PShape[14];
float zoom = 260;

float delta = 0.0;
float lastMillis = 0.0;

float rotateX = 0;
float rotateY = 0;

float rotation = 180;
float rotationY = 180;

void setup() {
	size(1280, 720, P3D);
	smooth(8); // Suavizar las líneas

	desImg = loadImage("desesperado.png"); //imagen 2D

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

	perspective(radians(40), (float)width/height, 0.1, 100000.0);
	frameRate(1000);
}

void draw() {
	background(255);
	dibujarEjes3D(50);

	rotateX = mouseX;
	rotateY = mouseY;
	
	//float coordX = - zoom * cos(radians(rotation)) + 0;
	float coordY = - zoom * sin(radians(rotation)) + 0;
  float coordZ = zoom * sin(radians(rotationY)) + 0;

	camera(-260, coordY, coordZ , 70, 0, 40, 0, 0, -1);

	translate(0, 0, 0);

	// Dibujar objetos 3D
	pushMatrix();
		scale(-1, 1, 1);
		scale(50);

		// Dibujar todo el fondo
		for (int i = 0; i < s.length; ++i) {
		shape(s[i], 0, 0);
		}
	popMatrix();

	pushMatrix();
	float scale = 1.0/12.0;
	rotateZ(radians(90));
	rotateX(radians(-90));

	// Dibujar Desesperado
	pushMatrix();
		translate(0, -30, 60);
		image(desImg, 
			-(desImg.width * scale) / 2.0, -(desImg.height * scale) / 2.0, // Poner su origen en el centro
			desImg.width * scale, desImg.height * scale); // Poner el tamaño de la imagen escalada
	popMatrix();

	popMatrix();

	delta = millis() - lastMillis;
	lastMillis = millis();

	// Poner los fps en el título
	surface.setTitle(str(frameRate));

	/* Usar delta para que la velocidad de vuelta no
	cambie con la velocidad a la que se ejecuta el programa */
	//rotation += 0.5 * (delta / 50);
  inter = map(mouseX, 0, 1280, -100, 100);
  interY = map(mouseY, 0, 720, 160, 250);
  rotation = 0.5 * (inter/15);
  rotationY = 0.5 * (interY/5);
  //println( coordY) ;
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
