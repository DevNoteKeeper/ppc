class Word {
  
 String myWord;
 float x = width/2;
 float y = 0;
 float angle;
 Letter [] letters;

 Word (String word, float x, float y) {
    myWord = word;
    this.x = x;
    this.y = y;
    letters = new Letter [myWord.length()];
    
    // split te word in an array of the individual letters
    for(int i = 0; i< letters.length; i++) {
      letters[i] = new Letter (myWord.charAt(i), random(20, width-20), random(20,height-20));
    }
 }
 
 void drawWord(){
   pushMatrix();
   updateWord();
   rotate(angle); 
   fill(200,10,200);
   textSize(35);
   text(myWord, x,y);
   popMatrix();
   println(x, y);
  
 }
 
 void drawLetters(){
   for(int i = 0; i< letters.length; i++) {
      letters[i].drawLetter();
    } 
 }
 
 
 void updateWord(){
   // anything changing position and rotation
   if(x >= width/2 - 100 & y >= height/3){
   x -= 2;
   y += 2;
   }
   else if(y >= height/3){
    x += 2;
   }
 }
 
}
