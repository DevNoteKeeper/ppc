// here is a very small fragment for a text animation program
// for the first assignment of Programming and Physical Computing
// you may use it, or just partly, extend, or throw it away and do sth different,
// read from a file, add more interesting interaction, more fonts, effect,
// make an array of words where each one has an own color, let them fade, explode,
// be creative!
// angelika mader november 2021

ArrayList<Word> words = new ArrayList<>();
Word wordForLetter;
PFont font;
int state;  // this program has two states so far

void setup() {
  size(800, 600, P3D);
  font = createFont("BananaDays-nRMLV.ttf", 40);
  String[] lines = loadStrings("file.txt");
  int wordWidth = 0;
  for(int i = 0; i < lines.length; i++){
    int wordLength = lines[i].length(); 
    int gapSize = 20; 
    int textSize = 15;
    words.add(new Word(lines[i], wordWidth, height/2, font));
    wordWidth += wordLength*textSize+gapSize;
  }

  wordForLetter = combineWords(words);
  // word = new Word(lines[0], width/2, height/2);


  state = 0;  // the initial stat is 0
}

void draw() {
  background(0);

  switch(state) {      // here a case distinction using a switch instruction
  case 0:
  for(Word word : words){
    word.drawWord();
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
  return new Word(combinedText.toString().trim(), width/2, height/2, font);
}

void mouseClicked() {  // super simple interaction:
    state = 1 - state;   // the state changes on mouse click
}
void keyPressed(){
  if(key == ' '){
    wordForLetter.toggleTreeShape();
    
  }
}
