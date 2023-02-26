import uibooster.UiBooster;
import uibooster.model.Form;
import uibooster.model.FormElement;
import java.awt.Font;
int opinionCount = 0;
int highEnergy = 0;
int showResultInt = 0;
String[] polaritiesArray = new String [4];

float positivePolarity = 0;
float negativePolarity = 0;
float neutralPolarity= 0;
float compoundPolarity = 0;
int sentimentAmount = 0;
int valenceCount =0;




void launchGUI(String lowETitle, String lowEArtist, String highETitle, String highEArtist) {
  new UiBooster(new Font("Calibri", Font.PLAIN, 16))
    .createForm("Song Selector")
    .addLabel("Song A: " + lowETitle + " : " + lowEArtist)
    .setID("songA")
    .addLabel("Song B: " + highETitle + " : " + highEArtist)
    .setID("songB")
    .addButton("Select Song A", () -> doNothingButAdd())
    .setID("selectA")
    .addButton("Select Song B", () -> doNothingButOpinionCount())
    .setID("selectB")
    .addButton("Don't Know", () -> justIncrease())
    .setID("noOpinion")
    .addButton("Show my result", ()-> showResultInt = 1)
    .setID("showResult")
    .setChangeListener((element, value, form) -> extractUserInputForSketch(element, form))
    .run();
}

void extractUserInputForSketch(FormElement element, Form form) {
  String songDescription = "no selection";

  switch (element.getId()) {
  case "selectA":
    songDescription = form.getById("songA").asString();
    if (lowValenceArray[currentPosition]!=10){
    totalValence += lowValenceArray[currentPosition];
  valenceCount +=1;}
    break;
  case "selectB":
    songDescription = form.getById("songB").asString();
    if (highValenceArray[currentPosition]!=10){
    totalValence += highValenceArray[currentPosition];
    valenceCount +=1;}
    break;
   case "noOpinion":
   songDescription = "";
   break;
  }

  if (songDescription.equals("no selection") == false && opinionCount<10) {
    try {
      if (songDescription !=""){
      String [] parts = songDescription.split(":");
      Song s = new Song(trim(parts[1]), trim(parts[2]));
      s.getLyrics();
      songs.add(s);
      println(s.sentiment());

      String sentimentCopy = s.sentiment();
      polaritiesArray = sentimentCopy.split(",");
      String positivePolarityS = polaritiesArray[0].substring(37);
      String negativePolarityS = polaritiesArray[1].substring(18);
      String neutralPolarityS= polaritiesArray[2].substring(17);
      String compoundPolarityS = polaritiesArray[3].substring(18, (polaritiesArray[3].length()-1));
      positivePolarity += Float.parseFloat(positivePolarityS);
      negativePolarity += Float.parseFloat(negativePolarityS);
      neutralPolarity += Float.parseFloat(neutralPolarityS);
      compoundPolarity += Float.parseFloat(compoundPolarityS);
      sentimentAmount +=1;}
    }
    catch (NullPointerException e)
    {
      println("Oops");
    }
  }

  if (opinionCount<10 && songDescription.equals("no selection") == false ) {
    String lowETitle = lowEnergyArray[currentPosition][0];
    String lowEArtist = lowEnergyArray[currentPosition][1];
    String highETitle = highEnergyArray[currentPosition][0];
    String highEArtist = highEnergyArray[currentPosition][1];
    form.getById("songA").setValue("Song A: " + lowETitle + " : " + lowEArtist);
    form.getById("songB").setValue("Song B: " + highETitle + " : " + highEArtist);
  }
  currentPosition += 1;
}

void justIncrease() {
  showResultInt = 0;
      
}
void doNothingButAdd() {
  showResultInt = 0;
  highEnergy +=1;
  opinionCount += 1;
      

}
void doNothingButOpinionCount() {
  showResultInt = 0;
  opinionCount += 1;
}
