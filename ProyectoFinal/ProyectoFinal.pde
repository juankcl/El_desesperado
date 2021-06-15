//Imagen 2D
PImage desImg;
PGraphics pg;
float inter = 0;
float interY= 0;
//3D
PShape s[] = new PShape[15];
float zoom = 260;
// Virus
VirusSpawner virus;

float delta = 0.0;
float lastMillis = 0.0;

float rotateX = 0;
float rotateY = 0;

float rotation = 180;
float rotationY = 180;

//timeline - botnones
Buttons buton;
Buttons buton2;
Buttons buton3;
Buttons buton4;
Buttons buton5;
Buttons buton6;
Buttons buton7;
Buttons buton8;
Buttons buton9;
Buttons buton10;
Buttons buton11;

PImage imgButton[] = new PImage[11];

void setup() {
	size(1280, 720, P3D);
	smooth(8); // Suavizar las líneas

	desImg = loadImage("desesperado.png"); //imagen 2D

	virus = new VirusSpawner(24);

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
	s[13] = loadShape("Ceiling.obj");
	// Las luces van al final
	s[14] = loadShape("Lights.obj");
  
  // imagenes botones
  imgButton[0] = loadImage("Timeline/1.png");
  imgButton[1] = loadImage("Timeline/2.png");
  imgButton[2] = loadImage("Timeline/3.png");
  imgButton[3] = loadImage("Timeline/4.png");
  imgButton[4] = loadImage("Timeline/5.png");
  imgButton[5] = loadImage("Timeline/6.png");
  imgButton[6] = loadImage("Timeline/7.png");
  imgButton[7] = loadImage("Timeline/8.png");
  imgButton[8] = loadImage("Timeline/9.png");
  imgButton[9] = loadImage("Timeline/10.png");
  imgButton[10] = loadImage("Timeline/00_cubrebocas.png");

    // timeline - botones declaracion  
  buton   = new Buttons(50, 50, 30,  color(255,255,255), imgButton[10], true );  
  buton2  = new Buttons(50,110, 30,   color(255,255,255), imgButton[0], false );
  buton3  = new Buttons(50, 170, 30,  color(255,255,255), imgButton[1], false );
  buton4  = new Buttons(50, 230, 30,  color(255,255,255), imgButton[2], false );
  buton5  = new Buttons(50, 290, 30,  color(255,255,255), imgButton[3], false );
  buton6  = new Buttons(50, 350, 30,  color(255,255,255), imgButton[4], false );
  buton7  = new Buttons(50, 410, 30,  color(255,255,255), imgButton[5], false );
  buton8  = new Buttons(50, 470, 30,  color(255,255,255), imgButton[6], false );
  buton9  = new Buttons(50, 530, 30,  color(255,255,255), imgButton[7], false );
  buton10 = new Buttons(50, 590, 30,  color(255,255,255), imgButton[8], false );
  buton11 = new Buttons(50, 650, 30,  color(255,255,255), imgButton[9], false );
  
  //
	perspective(radians(40), (float)width/height, 0.1, 100000.0);
	frameRate(1000);
}

void draw() {
	background(255);

	// 3D Va aqui
	hint(ENABLE_DEPTH_TEST);

	rotateX = mouseX;
	rotateY = mouseY;
	
	//float coordX = - zoom * cos(radians(rotation)) + 0;
	float coordY = - zoom * sin(radians(rotation)) + 0;
	float coordZ = zoom * sin(radians(rotationY)) + 0;

	perspective(radians(40), (float)width/height, 0.1, 100000.0);
	camera(-260, coordY, coordZ , 70, 0, 40, 0, 0, -1);

	translate(0, 0, 0);
	dibujarEjes3D(50);

	// Dibujar objetos 3D
	pushMatrix();
		scale(-1, 1, 1);
		scale(50);
		translate(0, -0.3, 0);
		// Dibujar todo el fondo
		for (int i = 0; i < s.length; ++i) {
		shape(s[i], 0, 0);
		}
	popMatrix();

	pushMatrix();
		float scale = 1.0/12.0;
		rotateZ(radians(90));
		rotateX(radians(-90));

		virus.draw();
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

	// Interfaz va aqui
	hint(DISABLE_DEPTH_TEST);
	camera();
	ortho();
	stroke(0);
   pushMatrix();
   //stroke(255);
    fill(255,255,255, 100);
    rect(20, 15, 60,height- 30, 10);
   popMatrix();
	fill(255);
  buton.pressed();
  buton2.pressed();
  buton3.pressed();
  buton4.pressed();
  buton5.pressed();
  buton6.pressed();
  buton7.pressed();
  buton8.pressed();
  buton9.pressed();
  buton10.pressed();
  buton11.pressed();
  

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
