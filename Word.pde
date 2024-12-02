class Word {
  PFont font;
 String myWord;
 float x = width/2;
 float y = 0;
 float angle;
 Letter [] letters;
boolean isTreeShapeChanged = false;

 Word (String word, float x, float y, PFont font) {
  String wordWithoutSpace = word.replaceAll(" ", "");
    myWord = wordWithoutSpace;
    this.x = x;
    this.y = y;
    this.font = font;
    letters = new Letter [myWord.length()];
    updateTreeShape();
  
 }

 
 void drawWord(){
  updateWord();
   pushMatrix();
   updateWord();
   rotate(angle); 
   fill(200,10,200);
   textSize(35);
   text(myWord, x,y);
   popMatrix();
   println(x, y);
  
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
 
 void drawLetters(float mouseX, float mouseY){
   for(int i = 0; i< letters.length; i++) {
    if(letters[i] != null){
      letters[i].drawLetter();
      letters[i].updateAlpha();
      letters[i].updateRotation();
      letters[i].checkMouseProximity(mouseX, mouseY);
    } }
 }

 void toggleTreeShape(){
  //change tree shpae
  isTreeShapeChanged = !isTreeShapeChanged;
  //update changed tree
  updateTreeShape();
 }

  int calculateRows(int letterCount){
    int row = 0;
    int totalLetters = 0;
    while(totalLetters < letterCount){
      row++;
      totalLetters += row;
    }
    return row;
 }

 int calculateRowsWithBoundary(int letterCount){
  int row = 2;
  int totalLetters = 1;
  int remainingLetters = letterCount - totalLetters;

  while(remainingLetters > row){
    row++;
    remainingLetters-=2;
  }
  return row;
 }

 void updateTreeShape(){
  int row = 0;
  int countInRow = 1;
  int letterIndex = 0;
  int yStart = 100;
  float rowSpacing = 50;
  float baseX = width/2;

    if(isTreeShapeChanged){
    row = calculateRowsWithBoundary(myWord.length());
  }else{
    row = calculateRows(myWord.length());
  }


  for(int currentRow = 0; currentRow < row; currentRow++){
    for(int i = 0; i < countInRow; i++){
      if(letterIndex >= myWord.length())break;
      //calculate x, yposition
      float xPosition = baseX + (i-(countInRow-1)/2.0)*60;
      float yPosition = yStart + currentRow*rowSpacing;

      boolean isBoundary = isBoundaryLetter(currentRow, i, countInRow, row);

      if(isBoundary || !isTreeShapeChanged){
        letters[letterIndex] = new Letter(myWord.charAt(letterIndex), xPosition, yPosition, font);
        letterIndex++;
      }
    }
    countInRow++;
  }
 }
 boolean isBoundaryLetter(int currentRow, int i, int countInRow, int row){
  if(currentRow == 0){
    return (i == countInRow/2);
  }else if(currentRow == row-1){
    return true;
  } else{
    return(i == 0 || i == countInRow -1);
  }
 }

 
 
 

 
}
