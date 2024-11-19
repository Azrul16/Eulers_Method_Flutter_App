void solveThermalDynamics(List<double> timeValues, List<double> solutionValues,
    double stepSize, int steps) {
  double T = 100; // Initial temperature
  double k = 0.1; // Heat transfer constant
  double ambientTemp = 25; // Ambient temperature

  for (int t = 0; t <= steps; t++) {
    timeValues.add(t * stepSize);
    solutionValues.add(T);
    T = T - stepSize * k * (T - ambientTemp);
  }
}
