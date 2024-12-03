// here is a very small fragment for a text animation program
// for the first assignment of Programming and Physical Computing
// you may use it, or just partly, extend, or throw it away and do sth different,
// read from a file, add more interesting interaction, more fonts, effect,
// make an array of words where each one has an own color, let them fade, explode,
// be creative!
// angelika mader november 2021

ArrayList<Word> words = new ArrayList<>();
Word wordForLetter;
PImage backgoundImage;
int state;  // this program has two states so far

void setup() {
  size(800, 600, P3D);
  String[] lines = loadStrings("file.txt");
  int wordWidth = 0;
  for(int i = 0; i < lines.length; i++){
    int wordLength = lines[i].length(); 
    int gapSize = 20; 
    int textSize = 15;
    words.add(new Word(lines[i], wordWidth, height/2));
    wordWidth += wordLength*textSize+gapSize;
  }
  wordForLetter = combineWords(words);
  state = 0;  // the initial stat is 0

  backgoundImage = loadImage("image/2.jpeg");
}

void draw() {
  background(0);
  backgoundImage = updateBackgroundWithInteraction(backgoundImage);

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

PImage updateBackgroundWithInteraction(PImage img) {
  img.loadPixels();

  for (Word word : words) {
    float wordX = word.getX();
    float wordY = word.getY();
    float wordWidth = word.getWidth();  // Assuming you can calculate the width of the word
    float wordHeight = word.currentScale; // Assuming you can calculate the height of the word

    for (int px = int(wordX - wordWidth / 2); px < int(wordX + wordWidth / 2); px++) {
      for (int py = int(wordY - wordHeight / 2); py < int(wordY + wordHeight / 2); py++) {
        if (px >= 0 && px < img.width && py >= 0 && py < img.height) {
          int index = px + py * img.width;
          color originColor = img.pixels[index];
          float distance = dist(wordX, wordY, px, py);

          float proximityThreshold = word.currentScale * 0.5;  

          if (distance < proximityThreshold) {
            // Invert color or apply effect
            int r = constrain(255 - int(red(originColor)), 0, 255);
            int g = constrain(255 - int(green(originColor)), 0, 255);
            int b = constrain(255 - int(blue(originColor)), 0, 255);
            img.pixels[index] = color(r, g, b);  // Inverted color effect
          }
        }
      }
    }
  }

  img.updatePixels();
  return img;
}





  
  

