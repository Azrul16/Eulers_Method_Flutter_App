void solveChemicalReaction(List<double> timeValues, List<double> solutionValues,
    double stepSize, int steps) {
  double C = 50; // Initial concentration
  double k = 0.1; // Reaction rate constant

  for (int t = 0; t <= steps; t++) {
    timeValues.add(t.toDouble());
    solutionValues.add(C);
    C = C - stepSize * k * C;
  }
}
