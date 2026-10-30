void setup() {
  size(600, 450);
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
