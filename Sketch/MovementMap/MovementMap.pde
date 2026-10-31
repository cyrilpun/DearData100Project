Table movementData;

void setup() {
  size(600, 450);

  //Load the csv data
  movementData = loadTable("Movement_Data.csv", "header");

  println("Number of observations: " + movementData.getRowCount());
  println("Number of columns: " + movementData.getColumnCount());

  // Read every observation in the CSV
  for (int i = 0; i < movementData.getRowCount(); i++) {

    // Get the current row
    TableRow row = movementData.getRow(i);

    //Read information from that row
    String activity = row.getString("Activity");
    String category = row.getString("Category");
    int duration = row.getInt("Duration(min)");
    int effort = row.getInt("Effort");


    //Only process non-sedentary observations
    if (!category.equals("Sedentary")) {

      //Print the observation in the console
      println("First activity: " + activity);
      println("Category: " + category);
      println("Duration: " + duration + " minutes");
      println("Effort: " + effort);
    }
  }

  background(245);

  // Project title
  fill(30);
  textSize(28);
  text("Movement Map", 40, 60);

  // Project subtitle
  textSize(14);
  fill(90);
  text("Exploring my daily physical activites, time and effort", 40, 90);

  // first activity symbol
  fill(70, 130, 180);
  noStroke();
  ellipse(100, 170, 50, 50);

  // activity level
  fill(30);
  textSize(14);
  text("Football", 70, 210);
}
