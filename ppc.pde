// here is a very small fragment for a text animation program
// for the first assignment of Programming and Physical Computing
// you may use it, or just partly, extend, or throw it away and do sth different,
// read from a file, add more interesting interaction, more fonts, effect,
// make an array of words where each one has an own color, let them fade, explode,
// be creative!
// angelika mader november 2021

ArrayList<Word> words = new ArrayList<>();
Word wordForLetter;
ImageElement images;
PImage backgoundImage;
int state;  // this program has two states so far

void setup() {
  size(800, 600, P3D);
  String[] lines = loadStrings("file.txt");
  int wordWidth = 50;
  for(int i = 0; i < lines.length; i++){
    int wordLength = lines[i].length(); 
    int gapSize = 40; 
    int textSize = 15;
    words.add(new Word(lines[i], wordWidth, height/2));
    wordWidth += wordLength*textSize+gapSize;
  }
  wordForLetter = combineWords(words);
  state = 0;  // the initial stat is 0
  images = new ImageElement();
  backgoundImage = images.changeImageOverTime();
}

void draw() {
  background(0);
  backgoundImage = images.changeImageOverTime();
  updateTextColorBasedOnBackground(backgoundImage);
  updateBackgroundWithTextColorComplement(backgoundImage);
  image(backgoundImage, 0, 0, width, height);
  switch(state) {      // here a case distinction using a switch instruction
  case 0:
  for(Word word : words){
    word.drawText();
    word.updateScale();
  }
    break;
  case 1:
    wordForLetter.drawLetters(mouseX, mouseY);
    break;
    
  }
}

Word combineWords(ArrayList<Word> words){
  StringBuilder combinedText = new StringBuilder();
  for(Word word : words){
    combinedText.append((word.myWord));
  }
  return new Word(combinedText.toString().trim(), width/2, height/2);
}

void mouseClicked() {  // super simple interaction:
    state = 1 - state;   // the state changes on mouse click
}
void keyPressed(){
  if(key == ' '){
    wordForLetter.toggleTreeShape();
    
  }}


int[] getWordPixelRange(Word word, PImage img){
  float wordX = word.getX();
  float wordY = word.getY();
  float wordWidth = word.getWidth();
  float wordHeight = word.currentScale;

  //calculate ratio of image and canvas
  float imgWidthRatio = (float) img.width / width;  
  float imgHeightRatio = (float) img.height / height; 

  //calculate text range
    int startX = int((wordX - wordWidth / 2) * imgWidthRatio);
    int endX = int((wordX + wordWidth / 2) * imgWidthRatio);
    int startY = int((wordY - wordHeight / 2) * imgHeightRatio);
    int endY = int((wordY + wordHeight / 2) * imgHeightRatio);

return new int[]{
  startX, endX, startY, endY
};

}

color getComplementaryColor(color textColor){
  return color(255 - red(textColor), 255 - green(textColor), 255 - blue(textColor));
}

boolean isValidPixel(int px, int py, PImage img){
  return px >= 0 && px < img.width && py >= 0 && py < img.height;
}

void updateTextColorBasedOnBackground(PImage img) {
  img.loadPixels();

  for (Word word : words) {
    int[] range = getWordPixelRange(word, img);
    int startX = range[0];
    int endX = range[1];
    int startY = range[2];
    int endY = range[3];

    float totalBrightness = 0;
    int pixelCount = 0;
    float minBrightness = Float.MAX_VALUE;
    float maxBrightness = -Float.MAX_VALUE;

    for(int px = startX; px < endX; px++){
      for(int py = startY; py < endY; py++){
        if(isValidPixel(px, py, img)){
          int index = px + py * img.width;
          color pixelColor = img.pixels[index];

          float brightnessValue = brightness(pixelColor);
          totalBrightness += brightnessValue;
          pixelCount++;

          minBrightness = min(minBrightness, brightnessValue);
          maxBrightness = max(maxBrightness, brightnessValue);
        }
      }
    }

   float averageBrightness = totalBrightness/pixelCount;
   float brightnessDifference = maxBrightness - minBrightness;
          // If the brightness is above a certain threshold, change the text color
    if (brightnessDifference < 30) {
      word.setTextColor(color(255, 0, 0));  // Red color (low contrast)
    } else if (averageBrightness > 230) {
      word.setTextColor(color(150, 150, 150));  // Red color
    }else if(brightnessDifference < 200){
      word.setTextColor(color(100, 100, 100));
    }
     else if (averageBrightness > 200) {
      word.setTextColor(color(0, 0, 255)); // Blue color
    } else {
      word.setTextColor(color(0, 255, 0));  // Green color
    }  
  }


  img.updatePixels();
}

void updateBackgroundWithTextColorComplement(PImage img){
  img.loadPixels();
  for(Word word : words){
    int[] range = getWordPixelRange(word, img);
    int startX = range[0];
    int endX = range[1];
    int startY = range[2];
    int endY = range[3];

    color textColor = word.getTextColor();
    color complementColor = getComplementaryColor(textColor);

        for(int px = startX; px < endX; px++){
      for(int py = startY; py < endY; py++){
        if(isValidPixel(px, py, img)){
          int index = px + py*img.width;
          img.pixels[index] = complementColor;

        }}}
  }
  img.updatePixels();
}







  
  

