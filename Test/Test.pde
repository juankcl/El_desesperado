PShape s;
float zoom = 150;

float delta = 0.0;
float lastMillis = 0.0;

float rotateX = 0;
float rotateY = 0;

float rotation = 0;
void setup() {
	size(1200, 800, P3D);
	//smooth(8);

	s = loadShape("Cuarto.obj");
	perspective(PI/3.0,(float)width/height,0.1,100000.0);
	frameRate(1000);
}

void draw() {
	background(255);
	//lights();

	dibujarEjes3D(50);
	//noFill();
	
	rotateX = mouseX;
	rotateY = mouseY;

	float coordX = zoom * cos(radians(rotation)) + 0;
	float coordY = zoom * sin(radians(rotation)) + 0;
	
	camera(coordX, coordY, 80, 0, 0, 50, 0, 0, -1);
	
	translate(0, 0, 0);
	scale(-1, 1, 1);
	scale(20);
	shape(s, 0, 0);


	delta = millis() - lastMillis;
	lastMillis = millis();


	surface.setTitle(str(frameRate));
	rotation += 5.0 * (delta / 100);
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
