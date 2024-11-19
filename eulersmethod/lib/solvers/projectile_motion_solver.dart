import 'dart:math';

void solveProjectileMotion(List<double> timeValues, List<double> solutionValues,
    double stepSize, int steps) {
  double velocity = 50; // Initial velocity (m/s)
  double angle = 45; // Launch angle (degrees)
  double g = 9.8; // Acceleration due to gravity (m/s²)
  double radianAngle = angle * (3.14159 / 180); // Convert to radians

  double vx = velocity * cos(radianAngle); // Horizontal velocity
  double vy = velocity * sin(radianAngle); // Vertical velocity
  double x = 0; // Initial x position
  double y = 0; // Initial y position

  for (int t = 0; t <= steps; t++) {
    timeValues.add(t * stepSize);
    solutionValues.add(y);

    x += stepSize * vx;
    vy -= stepSize * g;
    y += stepSize * vy;

    if (y < 0) break; // Stop if projectile hits the ground
  }
}
