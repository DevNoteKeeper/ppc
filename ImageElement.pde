class ImageElement {
    PImage[] image = new PImage[3]; 
    int time;
    int lastChangeTime;
    int changeInterval;

    ImageElement() {
        setImages();
        time = 0;
        lastChangeTime = 0;
        changeInterval = 1000;
    }

    void setImages() {
        image[0] = loadImage("image/2.jpeg");
        image[1] = loadImage("image/3.jpeg");
        image[2] = loadImage("image/1.png");
    }


    PImage changeImageOverTime() {
        int currentTime = millis();

        if(currentTime - lastChangeTime > changeInterval){
        time = (time + 1) % 3;
        lastChangeTime = currentTime;
        }


        return image[time];  
    }
}
