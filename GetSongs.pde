// Java ArrayList of Arrays
import java.io.*;
import java.util.List;

List<String[]> createLowList(String DATASET) {
  processing.data.Table dataset;
  dataset = loadTable(DATASET, "header");
  List lowEnergySongs = new ArrayList<String[]>();

  for (TableRow row : dataset.rows()) {
    String[] titleAndArtist;
    // if: volume_number and number > current volume_number and number
    if (row.getFloat("energy") < 0.4) {
      String title = row.getString("title");
      String artist = row.getString("artist");
      // add to highEnergySongs
      titleAndArtist = new String[2];
      titleAndArtist[0] = title;
      titleAndArtist[1] = artist;
      lowEnergySongs.add(titleAndArtist);
      // if bracket
    }
    // for bracket
  }
  return lowEnergySongs;
}

List<String[]> createHighList(String DATASET) {
  processing.data.Table dataset;
  dataset = loadTable(DATASET, "header");
  List highEnergySongs = new ArrayList<String[]>();
  for (TableRow row : dataset.rows()) {
    String[] titleAndArtist;
    // if: volume_number and number > current volume_number and number
    if (row.getFloat("energy") > 0.9) {
      String title = row.getString("title");
      String artist = row.getString("artist");
      // add to highEnergySongs
      titleAndArtist = new String[2];
      titleAndArtist[0] = artist;
      titleAndArtist[1] = title;
      highEnergySongs.add(titleAndArtist);
      // if bracket
    }
    // for bracket
  }
  return highEnergySongs;
}
List<Float> createLowValenceList(String DATASET){
    processing.data.Table dataset;
  dataset = loadTable(DATASET, "header");
  List lowValenceList = new ArrayList<Float>();
  
  for (TableRow row : dataset.rows()) {
    // if: volume_number and number > current volume_number and number
   try{ 
      if (row.getFloat("energy") < 0.4) {
      lowValenceList.add(row.getFloat("valence"));}}
      catch (NullPointerException exception) {
      lowValenceList.add(10.0);}}
      return lowValenceList;
}
List<Float> createHighValenceList(String DATASET){
  processing.data.Table dataset;
  dataset = loadTable(DATASET, "header");
  List highValenceList = new ArrayList<Float>();
  for (TableRow row : dataset.rows()) {
    try{ 
    // if: volume_number and number > current volume_number and number
    if (row.getFloat("energy") > 0.9) {
      highValenceList .add(row.getFloat("valence"));}
      }
      catch (NullPointerException exception) {
      lowValenceList.add(10.0);}}
      return highValenceList;
}
