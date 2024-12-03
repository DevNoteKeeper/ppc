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

  images = new ImageElement();
  backgoundImage = images.changeImageOverTime();
}

void draw() {
  background(0);
  if(frameCount %60 == 0){
    backgoundImage = updateBackgroundWithInteraction();
  }
  image(backgoundImage,0, 0, width, height);
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

  PImage updateBackgroundWithInteraction(){
    PImage img = backgoundImage;
    img.loadPixels();

    for(Word word : words){
      int textX = int(word.xPosition);
      int textY = int (word.yPosition);

      for(int dx = 20; dx <= 20; dx--){
        for(int dy = -20; dy <= 20; dy++){
          int px = textX+dx;
          int py = textY + dy;

          if(px >=0 && px < width && py>=0 && py < height){
            int index = px+py * img.width;
            color originColor = img.pixels[index];

            float distance = dist(0,0,dx,dy);
            if(distance < 50){
              float factor = map(distance, 0, 50, 1.5, 1.0);
              int r = constrain(int (red(originColor)*factor), 0, 255);
              int g = constrain(int (green(originColor)*factor), 0, 255);
              int b = constrain(int (blue(originColor)*factor), 0, 255);
              img.pixels[index] = color(r, g, b);
            }
          }
        }
      }
    }img.updatePixels();
    return img;
    }
  
  

