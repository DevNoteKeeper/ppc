class Letter {
  
 char myLetter;
 float xPosition, yPosition;
 color letterColor;
 float alpha;
 float alphaSpeed;
 float rotationSpeed;
 float currentRotation;
 
 Letter (char letter, float xPosition, float yPosition) {
    myLetter = letter;
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    letterColor = randomColor();
    alpha = random(50, 255);
    alphaSpeed = random(1,10);
    rotationSpeed = random(0.01, 0.05);
    currentRotation = 0;
 }
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
   textSize(40);
   text(myLetter, 0,0);
   popMatrix();
 }
 
 void updateAlpha(){
   // anything changing position and rotation
    alpha += alphaSpeed;
    if(alpha > 255 || alpha < 50){
      alphaSpeed*= -1;
    }

 }
 void updateRotation(){
  currentRotation += rotationSpeed;
  if(currentRotation > TWO_PI){
    currentRotation -= TWO_PI;
  }
 }
 
}
