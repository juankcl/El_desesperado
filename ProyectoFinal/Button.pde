class Buttons{
  color rectHighlight = color(204);
  boolean circleOver = false;
  //boolean circleOver = false;
  
  int posX_, posY_;
  int size_;
  color currentColor_; 
  PImage photo_;
  PImage virus;
  boolean cubrebocas_;
  
  Buttons(int posX, int posY, int size, color currentColor, PImage photo, boolean cubrebocas ){
    posX_ = posX;
    posY_ = posY;
    size_ = size;
    currentColor_ = currentColor;
    photo_ = photo;
    virus = loadImage("Timeline/virus_covid.png");
    cubrebocas_ = cubrebocas;
    
  }
  void pressed(){
    //background(0);
    update(mouseX, mouseY);
    if (circleOver) {
      fill(currentColor_, 80);
      //background(250);
      //image(photo_,width/2- 155,height/2 - 50, width/4,height/2  );
      if (cubrebocas_){
        image(photo_,width/2- 155,height/2 - 50, width/4,height/2  );
        pushMatrix();
          scale(0.2);
            image(virus,width/2,height/2);
            image(virus,width*3,height*3);
        popMatrix(); 
      }
      else{
      pushMatrix();
      scale(0.5);
      image(photo_,width/2 + 50, height/2 - 300);
      popMatrix();
    }
      
    } else {
      fill(currentColor_);
    }
    //stroke(255);
    circle(posX_,posY_, size_);    
    circle(posX_,posY_, size_+10);
    fill(255);

  }
 
  void update(int x, int y) {
if ( overCircle(posX_, posY_, size_) ) {
      circleOver = true;
      //circleOver = false;
    } 
    else {
      circleOver = false;
    }
  }
  
  
  
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
  
}
