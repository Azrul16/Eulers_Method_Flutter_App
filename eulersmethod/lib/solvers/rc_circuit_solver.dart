void solveRCCircuit(List<double> timeValues, List<double> solutionValues,
    double stepSize, int steps) {
  double V = 10; // Initial voltage (V)
  double R = 1; // Resistance (ohms)
  double C = 1; // Capacitance (farads)

  double tau = R * C; // Time constant
  double currentVoltage = V;

  for (int t = 0; t <= steps; t++) {
    timeValues.add(t * stepSize);
    solutionValues.add(currentVoltage);
    currentVoltage = currentVoltage - (stepSize / tau) * currentVoltage;
  }
}
