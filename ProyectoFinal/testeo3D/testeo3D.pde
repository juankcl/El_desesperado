float cx, cy, hw, hh, txscale = 2.0;
PImage texture;

size(500, 500, P3D);
textureMode(NORMAL);
textureWrap(REPEAT);
hw = width ;
hh = height ;
cx = width ;
cy = height ;
texture = loadImage("des.jpg");

beginShape(QUADS);
noStroke();
texture(texture);
vertex(cx - hw, cy - hh, 0.0, 0.0);
vertex(cx + hw, cy - hh, txscale, 0.0);
vertex(cx + hw, cy + hh, txscale, txscale);
vertex(cx - hw, cy + hh, 0.0, txscale);
endShape(CLOSE);
