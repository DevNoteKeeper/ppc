class FontElement{
    PFont font;

    FontElement(){
        this.font = randomFont();
    }

    PFont randomFont(){
        PFont randomFont = createFont("BananaDays-nRMLV.ttf", 40);
        int randomNum = int (random(4));

        switch(randomNum){
            case 0: createFont("BananaDays-nRMLV.ttf", 40);
                    break;
            case 1: randomFont = createFont("MerryChristmasFlake.ttf", 40);
                    break;
            case 2: randomFont = createFont("PWHappyChristmas.ttf", 40);
                                break;

            case 3: randomFont = createFont("LastChristmasSymbols_PERSONAL_USE_ONLY.otf", 40);
                    break;
        }
        return randomFont;
    }
}