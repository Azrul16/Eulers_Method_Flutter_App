void solvePopulationGrowth(List<double> timeValues, List<double> solutionValues,
    double stepSize, int steps) {
  double P = 1000; // Initial population
  double r = 0.05; // Growth rate

  for (int t = 0; t <= steps; t++) {
    timeValues.add(t.toDouble());
    solutionValues.add(P);
    P = P + stepSize * r * P;
  }
}
