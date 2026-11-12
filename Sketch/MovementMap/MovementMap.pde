Table movementData;

void setup() {
  size(900, 760);
  background(245);

  //Load the csv data
  movementData = loadTable("Movement_Data.csv", "header");

  println("Number of observations: " + movementData.getRowCount());
  println("Number of columns: " + movementData.getColumnCount());

  // Read every observation in the CSV
  int symbolCount = 0;
  int universityCount = 0;
  int nonUniversityCount = 0;
  int sedentaryCount = 0;

  int universityVisualCount = 0;
  int nonUniversityVisualCount = 0;

  for (int i = 0; i < movementData.getRowCount(); i++) {

    // Get the current row
    TableRow row = movementData.getRow(i);

    //Read information from that rowYe
    String activity = row.getString("Activity");
    String category = row.getString("Category");
    int duration = row.getInt("Duration(min)");
    int effort = row.getInt("Effort");
    String dayType = row.getString("Type").trim();

    //Only process non-sedentary observations
    if (!category.equals("Sedentary")) {

      if (dayType.equals("university")) {
        universityCount++;
      } else if (dayType.equals("non university")) {
        nonUniversityCount++;
      }

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
      int column = 0;
      int rowNumber = 0;
      float x = 0;
      float y = 0;

      if (dayType.equals("university")) {
        column = universityVisualCount % 10;
        rowNumber = universityVisualCount / 10;

        x = 40 + column * 55;
        y = 180 + rowNumber * 55;

        universityVisualCount++;
      } else if (dayType.equals("non university")) {
        column = nonUniversityVisualCount % 10;
        rowNumber = nonUniversityVisualCount / 10;

        x = 40 + column * 55;
        y = 500 + rowNumber * 55;

        nonUniversityVisualCount++;
      }

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


      //Print the observation in the console
      println("First activity: " + activity);
      println("Category: " + category);
      println("Duration: " + duration + " minutes");
      println("Effort: " + effort);
      println("Day type: " + dayType);
    } else {
      sedentaryCount++;
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
  
  // Day type headings 
  fill(30);
  textSize(18);
  text("University Days", 40, 140);
  text("Non-University Days", 40, 460);

  // Activity category legend heading
  fill(30);
  textSize(16);
  text("Activity Categories", 760, 65);

  // Gym
  fill(220, 80, 80);
  ellipse(770, 110, 12, 12);
  fill(30);
  textSize(12);
  text("Gym", 785, 114);

  // Sports
  fill(70, 130, 180);
  ellipse(770, 145, 12, 12);
  fill(30);
  text("Sports", 785, 149);

  // Cardio
  fill(240, 170, 60);
  ellipse(770, 180, 12, 12);
  fill(30);
  text("Cardio", 785, 184);

  // Commute
  fill(90, 170, 110);
  ellipse(770, 215, 12, 12);
  fill(30);
  text("Commute", 785, 219);

  // Recovery
  fill(150, 110, 190);
  ellipse(770, 250, 12, 12);
  fill(30);
  text("Recovery", 785, 254);

  // Duration legend heading
  fill(30);
  textSize(16);
  text("Activity Duration", 760, 300);

  // Small circle: less than 20 minutes
  fill(130);
  ellipse(770, 330, 15, 15);
  fill(30);
  textSize(12);
  text("< 20 min", 795, 334);

  // Medium circle: 20 to 44 minutes
  fill(130);
  ellipse(770, 370, 25, 25);
  fill(30);
  text("20-44 min", 795, 374);

  // Large circle: 45 minutes or longer
  fill(130);
  ellipse(770, 415, 35, 35);
  fill(30);
  text("45+ min", 795, 419);

  // Display observation counts in the console
  println("University observations: " + universityCount);
  println("Non-university observations: " + nonUniversityCount);
  println("Sedentary observations: " + sedentaryCount);
}
