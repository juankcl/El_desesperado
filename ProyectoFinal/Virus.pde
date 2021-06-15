public class Virus {
	PImage virusImg;
	float scale;
	PVector coords;
	public Virus (PImage img, float scale1, float scale2, float coordX, float coordY, float coordZ) {
		virusImg = img;
		coords = new PVector(coordX, coordY, coordZ);
		scale = random(scale1, scale2);
	}

	public void draw() {
		pushMatrix();
		
		translate(coords.x, coords.y, coords.z);
		
		image(virusImg,
			-(virusImg.width * scale) / 2.0, -(virusImg.height * scale) / 2.0, // Poner su origen en el centro
			virusImg.width * scale, virusImg.height * scale); // Escalar la imagen
		
		// dibujar cuerda
		stroke(220,220,220, 100);
		line(0, -(virusImg.height * scale) / 2.0, 0,
			0, -500, 0);

		popMatrix();
	}
}
