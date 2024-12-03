class Letter extends TextElement{
float xPosition, yPosition;

 
 Letter (char letter, float xPosition, float yPosition, PFont font) {
    super(String.valueOf(letter), xPosition, yPosition);

 }


 
 void drawLetter(){
   super.drawText();
 }
 


//moves the letter away from the mouse pointer when it's nearby
 void checkMouseProximity(float x, float y){
  float distance = dist(x, y, super.xPosition, super.yPosition);

  if(distance < 100){
    if(x > xPosition){
      super.xPosition -=2;
    }else{
      super.xPosition +=2;
    }
  }
 }
 
}
