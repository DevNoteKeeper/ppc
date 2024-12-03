class TextElement extends FontElement{
    PFont font;
    String myWord;
    float xPosition, yPosition;
    color textColor;
    float alpha;
    float alphaSpeed;
    float rotationSpeed;
    float currentRotation;
    TextElement(String word, float xPosition, float yPosition){
        super();
        this.myWord = word;
        this.xPosition = xPosition;
        this.yPosition = yPosition;
        this.font = super.font;
        this.textColor = randomColor();
        alpha = random(50, 255);
        alphaSpeed = random(1,10);
        rotationSpeed = random(0.01, 0.05);
        currentRotation = 0;
    }

    void drawText(){
        pushMatrix();
        translate(xPosition, yPosition);
        rotateY(currentRotation);
        fill(textColor, alpha);
        textFont(font);
        textSize(40);
        text(myWord, 0,0);
        popMatrix();
    }

     //set random color
    color randomColor(){
        color randomColor = color(0);
        int randomNum = int(random(3));

        switch(randomNum){
            //red
            case 0: randomColor = color(int(random(200, 255)), int(random(0, 50)), int(random(0, 50)));
                    break;
            //green
            case 1: randomColor = color(int(random(0, 50)), int(random(200, 255)), int(random(0, 50)));
                    break;
            //gold
            case 2: randomColor = color(int(random(200, 255)), int(random(200, 255)), int(random(0, 50)));
                    break;
        }
        return randomColor;
    }

    //change alpha value
    void updateAlpha(){
        alpha += alphaSpeed;
        if(alpha > 255 || alpha < 50){
        alphaSpeed*= -1;
        }
    }

    //change roatation
    void updateRotation(){
        currentRotation += rotationSpeed;
        if(currentRotation > TWO_PI){
            currentRotation -= TWO_PI;
        }
    }
}