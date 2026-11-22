// Physical activity observation
class MovementActivity {

  String activity;
  String category;
  int duration;
  int effort;
  String dayType;

  // Initialise an activity object
  MovementActivity(String a, String c, int d, int e, String t) {

    activity = a;
    category = c;
    duration = d;
    effort = e;
    dayType = t;
  }

  // Calculate circle size based on activity duration
  int getCircleSize() {

    if (duration < 20) {
      return 15;
    } else if (duration < 45) {
      return 25;
    } else {
      return 35;
    }
  }

  // Display the activity as a circle
  void display(float x, float y) {

    int circleSize = getCircleSize();
    
    // Set the colour using this object's category 
    setCategoryColour();

    ellipse(x, y, circleSize, circleSize);
  }
  
  // Set the colour based on activity category 
  void setCategoryColour() {
    
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
}
}
