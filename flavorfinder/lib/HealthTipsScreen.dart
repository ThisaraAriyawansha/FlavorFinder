import 'package:flutter/material.dart';

class HealthTipsScreen extends StatelessWidget {
  final List<HealthTip> healthTips = [
    HealthTip(
      title: "Stay Hydrated",
      description: "Drink at least 8 glasses of water a day.",
      icon: Icons.local_drink,
    ),
    HealthTip(
      title: "Eat Balanced Meals",
      description: "Include a variety of foods in your diet.",
      icon: Icons.restaurant,
    ),
    HealthTip(
      title: "Regular Exercise",
      description: "Engage in at least 30 minutes of physical activity daily.",
      icon: Icons.fitness_center,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Tips'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: healthTips.length,
        itemBuilder: (context, index) {
          final tip = healthTips[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(tip.icon, color: Colors.orange),
              title: Text(tip.title),
              subtitle: Text(tip.description),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to health tip detail page if needed
              },
            ),
          );
        },
      ),
    );
  }
}

class HealthTip {
  final String title;
  final String description;
  final IconData icon;

  HealthTip({
    required this.title,
    required this.description,
    required this.icon,
  });
}
