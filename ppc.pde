// here is a very small fragment for a text animation program
// for the first assignment of Programming and Physical Computing
// you may use it, or just partly, extend, or throw it away and do sth different,
// read from a file, add more interesting interaction, more fonts, effect,
// make an array of words where each one has an own color, let them fade, explode,
// be creative!
// angelika mader november 2021

Word word;
// PFont font;
int state;  // this program has two states so far

void setup() {
  size(400, 400);


  String[] lines = loadStrings("file.txt");
  word = new Word(lines[0], width/2, height/2);
//   font = createFont("banana-days-font/BananaDays-nRMLV.ttf", 60);

  state = 0;  // the initial stat is 0
}

void draw() {
  background(10, 200, 200);

  switch(state) {      // here a case distinction using a switch instruction
  case 0:
    word.drawWord();
    break;
  case 1:
    word.drawLetters();
  }
}

void mouseClicked() {  // super simple interaction:
    state = 1 - state;   // the state changes on mouse click
}
