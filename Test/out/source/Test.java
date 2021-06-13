import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Test extends PApplet {

PShape s;
float zoom = 150;

float delta = 0.0f;
float lastMillis = 0.0f;

float rotateX = 0;
float rotateY = 0;

float rotation = 0;
public void setup() {
	
	//smooth(8);

	s = loadShape("Cuarto.obj");
	perspective(PI/3.0f,(float)width/height,0.1f,100000.0f);
	frameRate(1000);
}

public void draw() {
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
	scale(50);
	shape(s, 0, 0);


	delta = millis() - lastMillis;
	lastMillis = millis();


	surface.setTitle(str(frameRate));
	rotation += 5.0f * (delta / 100);
}

public void dibujarEjes3D(float dim) {
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



public void mouseWheel(MouseEvent event) {
  zoom += event.getCount() * 2;
  println(zoom);
}
  public void settings() { 	size(800, 800, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
