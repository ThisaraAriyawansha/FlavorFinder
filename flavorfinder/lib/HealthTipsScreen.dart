import 'package:flutter/material.dart';

class HealthTipsScreen extends StatelessWidget {
  final List<HealthTip> healthTips = [
    HealthTip(
      title: "Stay Hydrated",
      description: "Drink at least 8 glasses of water a day.",
      details:
          "Proper hydration helps maintain bodily functions and overall health.",
      icon: Icons.local_drink,
    ),
    HealthTip(
      title: "Eat Balanced Meals",
      description: "Include a variety of foods in your diet.",
      details:
          "Balanced meals provide essential nutrients for energy and well-being.",
      icon: Icons.restaurant,
    ),
    HealthTip(
      title: "Regular Exercise",
      description: "Engage in at least 30 minutes of physical activity daily.",
      details:
          "Exercise improves cardiovascular health, muscle strength, and mental well-being.",
      icon: Icons.fitness_center,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Tips',
          style: TextStyle(
              color: Color.fromARGB(
                  255, 255, 255, 255)), // Set app bar title text color
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:
            const Color.fromARGB(255, 0, 0, 0), // Set app bar background color
      ),
      body: ListView.builder(
        itemCount: healthTips.length,
        itemBuilder: (context, index) {
          final tip = healthTips[index];
          return Card(
            color: Colors.blueGrey[50], // Background color of the Card
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              tileColor: Color.fromARGB(
                  255, 30, 29, 29), // Background color of the ListTile
              leading: Icon(tip.icon, color: Colors.redAccent),
              title: Text(
                tip.title,
                style: TextStyle(
                    color: const Color.fromARGB(221, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                tip.description,
                style:
                    TextStyle(color: const Color.fromARGB(137, 255, 255, 255)),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.redAccent),
              onTap: () {
                _showDetailsDialog(context, tip); // Show details in a dialog
              },
            ),
          );
        },
      ),
    );
  }

  void _showDetailsDialog(BuildContext context, HealthTip tip) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Colors.blueGrey[100], // Background color of the AlertDialog
          title: Text(
            tip.title,
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                tip.details,
                style: TextStyle(color: Colors.black),
              ), // Show detailed information
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Close',
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}

class HealthTip {
  final String title;
  final String description;
  final String details;
  final IconData icon;

  HealthTip({
    required this.title,
    required this.description,
    required this.details,
    required this.icon,
  });
}
