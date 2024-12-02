class Letter {
PFont font;
 char myLetter;
 float xPosition, yPosition;
 color letterColor;
 float alpha;
 float alphaSpeed;
 float rotationSpeed;
 float currentRotation;
 
 Letter (char letter, float xPosition, float yPosition, PFont font) {
    myLetter = letter;
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    this.font = font;
    letterColor = randomColor();
    alpha = random(50, 255);
    alphaSpeed = random(1,10);
    rotationSpeed = random(0.01, 0.05);
    currentRotation = 0;
 }

 //set random color
 color randomColor(){
  color randomColor = color(0);
  int randomNum = int(random(3));

  switch(randomNum){
    //red
    case 0: randomColor = color(int(random(200, 255)), int(random(0, 50)), int(random(0, 50)));
            break;
    //green
    case 1: randomColor = color(int(random(0, 50)), int(random(200, 255)), int(random(0, 50)));
            break;
    //gold
    case 2: randomColor = color(int(random(200, 255)), int(random(200, 255)), int(random(0, 50)));
            break;
  }
  return randomColor;
 }
 
 void drawLetter(){
   pushMatrix();
   translate(xPosition, yPosition);
   rotateY(currentRotation);
   fill(letterColor, alpha);
   textFont(font);
   textSize(40);
   text(myLetter, 0,0);
   popMatrix();
 }
 
 //change alpha value
 void updateAlpha(){
    alpha += alphaSpeed;
    if(alpha > 255 || alpha < 50){
      alphaSpeed*= -1;
    }
 }

//change roatation
 void updateRotation(){
  currentRotation += rotationSpeed;
  if(currentRotation > TWO_PI){
    currentRotation -= TWO_PI;
  }
 }

//moves the letter away from the mouse pointer when it's nearby
 void checkMouseProximity(float mouseX, float mouseY){
  float distance = dist(mouseX, mouseY, xPosition, yPosition);

  if(distance < 100){
    if(mouseX > xPosition){
      xPosition -=2;
    }else{
      xPosition +=2;
    }
  }
 }
 
}
