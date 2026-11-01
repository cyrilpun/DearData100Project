Table movementData;

void setup() {
  size(600, 450);
  background(245);

  //Load the csv data
  movementData = loadTable("Movement_Data.csv", "header");

  println("Number of observations: " + movementData.getRowCount());
  println("Number of columns: " + movementData.getColumnCount());

  // Read every observation in the CSV
  int symbolCount = 0;

  for (int i = 0; i < movementData.getRowCount(); i++) {

    // Get the current row
    TableRow row = movementData.getRow(i);

    //Read information from that rowYe
    String activity = row.getString("Activity");
    String category = row.getString("Category");
    int duration = row.getInt("Duration(min)");
    int effort = row.getInt("Effort");


    //Only process non-sedentary observations
    if (!category.equals("Sedentary")) {

      //Set circle size based on activity duration
      int circleSize;

      if (duration < 20) {
        circleSize = 15;
      } else if (duration < 45) {
        circleSize = 25;
      } else {
        circleSize = 35;
      }

      // Draw a circle for this observation
      fill(70, 130, 180);
      noStroke();
      ellipse(random(50, 550), random(150, 400), circleSize, circleSize);

      //Print the observation in the console
      println("First activity: " + activity);
      println("Category: " + category);
      println("Duration: " + duration + " minutes");
      println("Effort: " + effort);
    }
  }

  // Project title
  fill(30);
  textSize(28);
  text("Movement Map", 40, 60);

  // Project subtitle
  textSize(14);
  fill(90);
  text("Exploring my daily physical activites, time and effort", 40, 90);
}
