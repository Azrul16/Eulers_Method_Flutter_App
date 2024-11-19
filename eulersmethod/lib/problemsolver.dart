import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'solvers/population_growth_solver.dart';
import 'solvers/chemical_reaction_solver.dart';
import 'solvers/projectile_motion_solver.dart';
import 'solvers/rc_circuit_solver.dart';
import 'solvers/thermal_dynamics_solver.dart';

class ProblemSolverPage extends StatefulWidget {
  final int problemIndex;
  final String problemName;
  final String problemDescription;

  ProblemSolverPage({
    required this.problemIndex,
    required this.problemName,
    required this.problemDescription,
  });

  @override
  _ProblemSolverPageState createState() => _ProblemSolverPageState();
}

class _ProblemSolverPageState extends State<ProblemSolverPage> {
  late List<double> timeValues;
  late List<double> solutionValues;

  // User Input Fields
  final TextEditingController stepSizeController = TextEditingController();
  final TextEditingController stepsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    timeValues = [];
    solutionValues = [];
    _solveProblem(stepSize: 1.0, steps: 10); // Default values
  }

  void _solveProblem({required double stepSize, required int steps}) {
    timeValues.clear();
    solutionValues.clear();

    switch (widget.problemIndex) {
      case 0:
        solvePopulationGrowth(timeValues, solutionValues, stepSize, steps);
        break;
      case 1:
        solveChemicalReaction(timeValues, solutionValues, stepSize, steps);
        break;
      case 2:
        solveProjectileMotion(timeValues, solutionValues, stepSize, steps);
        break;
      case 3:
        solveRCCircuit(timeValues, solutionValues, stepSize, steps);
        break;
      case 4:
        solveThermalDynamics(timeValues, solutionValues, stepSize, steps);
        break;
      default:
        break;
    }
    setState(() {});
  }

  LineChart showGraph() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: true),
        minX: 0,
        maxX: timeValues.isNotEmpty ? timeValues.last : 1,
        minY: 0,
        maxY: solutionValues.isNotEmpty
            ? solutionValues.reduce((a, b) => a > b ? a : b)
            : 1,
        lineBarsData: [
          LineChartBarData(
            spots: timeValues
                .asMap()
                .map((i, time) => MapEntry(i, FlSpot(time, solutionValues[i])))
                .values
                .toList(),
            isCurved: true,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.problemName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Problem Description:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(widget.problemDescription),
              SizedBox(height: 16),
              TextField(
                controller: stepSizeController,
                decoration: InputDecoration(labelText: "Step Size"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              TextField(
                controller: stepsController,
                decoration: InputDecoration(labelText: "Number of Steps"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  final stepSize =
                      double.tryParse(stepSizeController.text) ?? 1.0;
                  final steps = int.tryParse(stepsController.text) ?? 10;
                  _solveProblem(stepSize: stepSize, steps: steps);
                },
                child: Text("Solve"),
              ),
              SizedBox(height: 16),
              Text(
                "Problem Solution:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              timeValues.isNotEmpty
                  ? Text(
                      timeValues
                          .asMap()
                          .entries
                          .map((e) =>
                              "Time ${e.key}: ${e.value}, Solution: ${solutionValues[e.key]}")
                          .join("\n"),
                    )
                  : Text("No solution yet."),
              SizedBox(height: 16),
              Text(
                "Graph:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(height: 300, child: showGraph()),
            ],
          ),
        ),
      ),
    );
  }
}
