import 'package:eulersmethod/problemsolver.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> problemTitles = [
    "Population Growth",
    "Chemical Reaction",
    "Projectile Motion",
    "RC Circuit",
    "Thermal Dynamics"
  ];

  final List<String> problemDescriptions = [
    "Population grows exponentially with a constant growth rate.",
    "Concentration of a chemical decreases exponentially over time.",
    "Simulates the trajectory of a projectile under gravity.",
    "Voltage across a capacitor decays in an RC circuit.",
    "A heated object cools over time towards the ambient temperature."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Euler's Method Problems"),
      ),
      body: ListView.builder(
        itemCount: problemTitles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(problemTitles[index]),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProblemSolverPage(
                      problemIndex: index,
                      problemName: problemTitles[index],
                      problemDescription: problemDescriptions[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
