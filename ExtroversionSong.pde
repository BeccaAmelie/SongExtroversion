import interfascia.*;

//import javax.xml.crypto.Data;
// import list
import java.util.List;
final String DATASET = "NOW-Kaggle-dataset.csv";

List<String[]> lowEnergylist, highEnergylist;
String[][] highEnergyArray, lowEnergyArray;
List<Float> lowValenceList, highValenceList;
Float[] lowValenceArray, highValenceArray;
Float totalValence = 0.0;


String lowETitle, highEArtist, highETitle, lowEArtist;
String highORlowE;
float resultDeterminant;
int currentPosition = 0;
List<Song> songs;


float avgPosPol = 0;
float avgNegPol = 0;
float avgNeuPol = 0;
float avgComPol = 0;


void setup() {
  size(1000, 600);
  frameRate(2);
  // originalList = createEarthquakeList(LIVE_DATA_SOURCE);
  songs = new ArrayList<>();

  lowEnergylist = createLowList(DATASET);
  highEnergylist = createHighList(DATASET);
  lowEnergyArray = lowEnergylist.toArray(new String [lowEnergylist.size()][2]);
  highEnergyArray = highEnergylist.toArray(new String [highEnergylist.size()][2]);
  lowETitle = lowEnergyArray[currentPosition][0];
  lowEArtist = lowEnergyArray[currentPosition][1];
  highETitle = highEnergyArray[currentPosition][0];
  highEArtist = highEnergyArray[currentPosition][1];
  
  //launchGUI(lowETitle, lowEArtist, highETitle, highEArtist);
  lowValenceList = createLowValenceList(DATASET);
  highValenceList = createHighValenceList(DATASET);
  lowValenceArray = lowValenceList.toArray(new Float [lowValenceList.size()]);
  highValenceArray = highValenceList.toArray(new Float [highValenceList.size()]);
 
  currentPosition +=1;
}
void draw() {
  background(#fc62fa);
  // if not started
      for (int i = 1; i <= 50; i++){
      frameRate(7);
      noStroke();;
      fill(random(50, 255), random(50, 255), random(50, 255));
      float bubbleSize =  random(50,70);
      ellipse(random(width), random(height), bubbleSize, bubbleSize);}
  if (opinionCount ==0 && showResultInt == 0 && currentPosition == 1) {
    pushStyle();
    
    fill(#000000);
    textAlign(CENTER);
     PFont boldfont = createFont("Arial Bold", 50);
    textFont(boldfont);
    text("SONG SELECTOR", width/10, height/2-200, width*.8, height/2);
    text("Choose the song you like better 10 times and get to know your personality and sentiment!", width/20, height/2-100, width*.9, height);
    
    if (mouseX >= 240 && mouseX<= 740 && mouseY>= 450 && mouseY <=510){fill(0,255,0);
    rect(240, height-150, width*.5, 60);
    fill(0,0,0);
  text("Start", (width/2)-15, height-100);}
    else{//startbutton
    fill(#03f0fc);
    rect(240, height-150, width*.5, 60);
    fill(0,0,0);
  text("Start", (width/2)-15, height-100);}
    
    popStyle();
    // if stared but less than 5 answers
  } else if (showResultInt == 1 && opinionCount < 5 ) {
    pushStyle();
    fill(#03f0fc);
    rect(width-900, height-500 , 800, 400);
    fill(random(50, 255), random(50, 255), random(50, 255));
    pushStyle();
    textAlign(CENTER);
    text("Your Results", width/9, height/5, width*.8, height/2);
    popStyle();
    //textAlign(RIGHT);
    fill(#212127);
    text(String.format("Not enough data to print result!"), width/9, height/2, width*.8, height);
    popStyle();
    // if more than five answers and want to see result or ten answers
  } else if ((showResultInt == 1 || opinionCount >=10) || (showResultInt == 1 && opinionCount >=5 ) || (showResultInt ==0 && opinionCount >=5 && currentPosition == 33)) {
    pushStyle();
    
    fill(#03f0fc);
    rect(width-900, height-500 , 800, 400);
    fill(random(50, 255), random(50, 255), random(50, 255));
    textSize(50);
    pushStyle();
    textAlign(CENTER);
    text("Your Results", width/9, height/5-10, width*.8, height/2);
    popStyle();
    fill(#212127);
    resultDeterminant = float(highEnergy)/float(opinionCount);
    if (resultDeterminant> 0.75) {
      highORlowE = "highly extroverted";
    } 
    else if (resultDeterminant >= 0.6) {
      highORlowE = "extroverted";
    }
    else if (resultDeterminant >= 0.5 && resultDeterminant < 0.6 ||resultDeterminant <= 0.5 && resultDeterminant > 0.4 ) {
      highORlowE = "ambivert";
    } else if (resultDeterminant < 0.4) {
      highORlowE = "introverted";
         } else if (resultDeterminant < 0.25) {
      highORlowE = "highly introverted";
    }
    textSize(30);// -20
    text(String.format("You are: %s", highORlowE), width/9, height/2-100);
    text("Your songs sentiment", width/9, height/2-40);
    
    avgPosPol = positivePolarity/sentimentAmount;
    avgNegPol = negativePolarity/sentimentAmount;
    avgNeuPol = neutralPolarity/sentimentAmount;
    avgComPol = compoundPolarity/sentimentAmount;
    
    //positive
    textSize(22);
    fill(#000000);
    text("Positive", width/9, height/2);
    fill(#ff2617);
    String avgPosPolS = String.format("%.2f", (avgPosPol*100));
    //avgPosPolS = String.valueOf(avgPosPol*100);
    fill(0,255,0);
    rect(width/4, height/2-20, ((width-375)*avgPosPol), 22);
    fill(#000000);
    text(String.format("%s", (avgPosPolS) + "%"), width/4, height/2);
    
    //Negative
    fill(#000000);
    text("Negative", width/9, height/2+40);
    fill(#212127);
    String avgNegPolS = String.format("%.2f", (avgNegPol*100));
    fill(255,0,0);
    rect(width/4, height/2+20, ((width-375)*avgNegPol), 20);
     fill(#000000);
    text(String.format("%s", (avgNegPolS) + "%"), width/4, height/2+40);
    
    //Neutral
    fill(#000000);
    text("Neutral", width/9, height/2+80);
    fill(#212127);
    String avgNeuPolS = String.format("%.2f", (avgNeuPol*100));
    fill(255,255,0);
    rect(width/4, height/2+60, ((width-375)*avgNeuPol), 20);
     fill(#000000);
    text(String.format("%s", (avgNeuPolS) + "%"), width/4, height/2+80);
    
    //Compound
    fill(#000000);
    text("Overall", width/9, height/2+120);
    fill(#212127);
    //String avgComPolS = String.format("%.2f", (avgComPol*100));
    fill(#606160);
    rect(width/4, height/2+100, 625, 10);
    
    textSize(15);
    fill(#606160);
    rect(width/4, height/2+100, 5, 20);
    fill(#000000);
    text("Negative",width/4-20,height/2+135);
    fill(#606160);
    rect(875, height/2+100, 5, 20);
    fill(#000000);
    text("Positive",840,height/2+135);
    fill(#606160);
    rect((width/4)+310, height/2+100, 5, 20);
    fill(#000000);
    text("Neutral",(width/4)+290,height/2+135);
    fill(0,0,255);
    rect((width/4)+312.5, height/2+100, ((width-375)*avgComPol), 20);
     fill(#000000);
    //text(String.format("%s", (avgComPolS) + "%"), width/4, height/2+140);
    
    // valence
    textSize(22);
     fill(#000000);
    text("Musical valence", width/9, height/2+140, width/8,400);
    //String avgComPolS = String.format("%.2f", (avgComPol*100));
    fill(#606160);
    rect(width/4, height/2+150, 625, 10);
    
    textSize(15);
    fill(#606160);
    rect(width/4, height/2+150, 5, 20);
    fill(#000000);
    text("Negative",width/4-20,height/2+185);
    
    fill(#606160);
    rect(875, height/2+150, 5, 20);
    fill(#000000);
    text("Positive",840,height/2+185);
    
    fill(#606160);
    rect((width/4)+310, height/2+150, 5, 20);
    fill(#000000);
    text("Neutral",(width/4)+290,height/2+185);
    
    fill(0,0,255);
    rect((width/4)+312.5, height/2+150, ((width-375)*(totalValence/valenceCount)*.5), 20);
    
    popStyle();
  }
  else {
    if (currentPosition == 33){
      textAlign(CENTER);
    PFont boldfont = createFont("Arial Bold", 50);
    textFont(boldfont);
    fill(0,0,0);
    text("Sorry, out of Songs!", width/10, height/2-200, width*.8, height/2);
    }
    for (int i = 1; i <= 100; i++){
      frameRate(7);
      noStroke();
      fill(random(0, 255), random(0, 255), random(0, 255));
      float bubbleSize =  random(50,100);
      ellipse(random(width), random(height), bubbleSize, bubbleSize);
    }
  }
}

void mouseClicked(){
  if (opinionCount ==0 && showResultInt == 0 && mouseX >= 240 && mouseX<= 740 && mouseY>= 450 && mouseY <=510){
    launchGUI(lowETitle, lowEArtist, highETitle, highEArtist);
  }
}
 
