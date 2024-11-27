class Letter {
  
 char myLetter;
 float xPosition, yPosition;
 float angle;
 color letterColor;
 
 Letter (char letter, float xPosition, float yPosition) {
    myLetter = letter;
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    angle = random (2 * PI);
    letterColor = color( int(random(150,250)), int(random(50)), int(random(150,200)));
 }
 
 void drawLetter(){
   pushMatrix();
   translate(xPosition, yPosition);
   rotate(angle);
   fill(letterColor);
   textSize(40);
   text(myLetter, 0,0);
   popMatrix();
 }
 
 void updateLetter(){
   // anything changing position and rotation
 }
 
}
