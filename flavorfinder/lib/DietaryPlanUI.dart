import 'package:flutter/material.dart';

// Define a class to represent a dietary plan
class DietaryPlan {
  final String title;
  final String description;
  final List<String> meals; // Example list of meals in the plan

  DietaryPlan({
    required this.title,
    required this.description,
    required this.meals,
  });
}

// Example data for pre-made dietary plans
List<DietaryPlan> preMadePlans = [
  DietaryPlan(
    title: 'Weight Loss Plan',
    description: 'Designed to help you lose weight.',
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
  ),
  DietaryPlan(
    title: 'Muscle Gain Plan',
    description: 'Tailored to support muscle growth and recovery.',
    meals: ['Breakfast', 'Morning Snack', 'Lunch', 'Afternoon Snack', 'Dinner'],
  ),
];

class DietaryPlanUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dietary Plans'),
          backgroundColor:
              Colors.black, // Set app bar background color to black
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pre-made Plans',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: preMadePlans.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(preMadePlans[index].title),
                        subtitle: Text(preMadePlans[index].description),
                        onTap: () {
                          // Navigate to plan details or customization page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PlanDetailsScreen(plan: preMadePlans[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanDetailsScreen extends StatelessWidget {
  final DietaryPlan plan;

  PlanDetailsScreen({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plan.title),
        backgroundColor: Colors.black, // Set app bar background color to black
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(plan.description),
            SizedBox(height: 20),
            Text(
              'Meals:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: plan.meals.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(plan.meals[index]),
                    // Add meal details or customization options as needed
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement customization functionality
                // Navigate to customization screen
                // This can be added later as per your requirement
              },
              child: Text('Customize Plan'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(DietaryPlanUI());
}
