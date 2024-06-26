import 'package:flutter/material.dart';

class HealthTipsScreen extends StatelessWidget {
  final List<HealthTip> healthTips = [
    HealthTip(
      title: "Stay Hydrated",
      description: "Drink at least 8 glasses of water a day.",
      details:
          "Proper hydration helps maintain bodily functions and overall health. It regulates body temperature, aids digestion, and flushes out toxins.",
      icon: Icons.local_drink,
    ),
    HealthTip(
      title: "Eat Balanced Meals",
      description: "Include a variety of foods in your diet.",
      details:
          "Balanced meals provide essential nutrients for energy and well-being. Include fruits, vegetables, whole grains, lean proteins, and healthy fats in your diet.",
      icon: Icons.restaurant,
    ),
    HealthTip(
      title: "Regular Exercise",
      description: "Engage in at least 30 minutes of physical activity daily.",
      details:
          "Exercise improves cardiovascular health, muscle strength, and mental well-being. It helps maintain a healthy weight, boosts mood, and reduces the risk of chronic diseases.",
      icon: Icons.fitness_center,
    ),
    HealthTip(
      title: "Get Sufficient Sleep",
      description: "Ensure 7-9 hours of quality sleep each night.",
      details:
          "Adequate sleep is crucial for overall health and well-being. It enhances brain function, supports immune function, and promotes physical and mental recovery.",
      icon: Icons.nights_stay,
    ),
    HealthTip(
      title: "Manage Stress",
      description: "Practice stress-relief techniques regularly.",
      details:
          "Chronic stress can negatively impact health. Practice relaxation techniques like deep breathing, meditation, or yoga to reduce stress levels and improve resilience.",
      icon: Icons.spa,
    ),
    HealthTip(
      title: "Maintain Social Connections",
      description: "Stay connected with friends and loved ones.",
      details:
          "Social connections contribute to mental and emotional well-being. They provide support, reduce feelings of loneliness, and promote a sense of belonging.",
      icon: Icons.group,
    ),
    HealthTip(
      title: "Limit Alcohol Consumption",
      description: "Drink alcohol in moderation, if at all.",
      details:
          "Excessive alcohol consumption can harm your health. Limit intake to moderate levels: up to one drink per day for women and up to two drinks per day for men.",
      icon: Icons.local_bar,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Tips',
          style: TextStyle(
            color: Colors.white, // App bar title text color
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black, // App bar background color
        elevation: 0, // Remove app bar elevation
        centerTitle: true, // Center app bar title
      ),
      backgroundColor: Colors.black, // Background color of the screen
      body: ListView.builder(
        itemCount: healthTips.length,
        itemBuilder: (context, index) {
          final tip = healthTips[index];
          return Card(
            color: Colors.grey[900], // Background color of the Card
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 4, // Card elevation
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              tileColor: Colors.grey[800], // Background color of the ListTile
              leading: Icon(tip.icon, color: Colors.redAccent, size: 32),
              title: Text(
                tip.title,
                style: TextStyle(
                  color: Colors.white, // Title text color
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  tip.description,
                  style: TextStyle(
                    color: Colors.white70, // Description text color
                    fontSize: 14,
                  ),
                ),
              ),
              trailing:
                  Icon(Icons.arrow_forward, color: Colors.redAccent, size: 28),
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
              Colors.grey[800], // Background color of the AlertDialog
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            tip.title,
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  tip.details,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ), // Details text
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Close',
                style: TextStyle(color: Colors.redAccent, fontSize: 18),
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
