public class VirusSpawner {
	Virus[] virusArray;
	PImage[] virusImgs = new PImage[4];

	public VirusSpawner (int number) {
		for (int i = 0; i < virusImgs.length; ++i) {
			virusImgs[i] = loadImage("Models/Virus"+ (i + 1) + ".png");
		}
		
			

		randomSeed(4500);
		virusArray = new Virus[number];

		int divisions = 6;
		int numberDivided = round(number / divisions);
		int depthDivided = round(140.0 / divisions);

		int counter = 0;
		for (int i = 1; i < divisions + 1; i++) {
			for (int j = counter; j < numberDivided * i; j++) {
				virusArray[j] = new Virus(
					virusImgs[round(random(0, virusImgs.length - 1))], 1.0/70.0, 1.0/90.0, 
					random(-110, 145), random(-120, -75), (depthDivided * i) - 65);
			}
			counter = numberDivided * i;
		}
	}

	public void draw() {
		for (int i = 0; i < virusArray.length; ++i) {
			virusArray[i].draw();
		}
	}

}
