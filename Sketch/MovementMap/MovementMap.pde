Table movementData;

void setup() {
  size(900, 450);
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

      //Calculate the position of this activity circle
      int column = symbolCount % 10;
      int rowNumber = symbolCount / 10;

      float x = 40 + column * 55;
      float y = 150 + rowNumber * 55;

      // Set the colour based on activity category
      if (category.equals("Gym")) {
        fill(220, 80, 80);
      } else if (category.equals("Sports")) {
        fill(70, 130, 180);
      } else if (category.equals("Cardio")) {
        fill(240, 170, 60);
      } else if (category.equals("Commute")) {
        fill(90, 170, 110);
      } else if (category.equals("Recovery")) {
        fill(150, 110, 190);
      } else {
        fill(130, 130, 130);
      }

      // Draw a circle for this observation
      noStroke();
      ellipse(x, y, circleSize, circleSize);

      symbolCount++;

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
  
  // Legend heading 
  fill(30); 
  textSize(16);
  text("Activity Categories", 760, 65);
}
