import 'package:flutter/material.dart';

// Define a class to represent a dietary plan
class DietaryPlan {
  final String title;
  final String description;
  List<String> meals; // Example list of meals in the plan

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

// List of suggested meals
Map<String, List<String>> mealSuggestions = {
  'Breakfast': ['Oatmeal', 'Smoothie', 'Eggs', 'Pancakes', 'Fruit Salad'],
  'Lunch': ['Grilled Chicken Salad', 'Quinoa Bowl', 'Vegetable Stir Fry'],
  'Dinner': ['Baked Salmon', 'Steak', 'Veggie Burger', 'Pasta'],
  'Snacks': ['Nuts', 'Yogurt', 'Fruit', 'Protein Bar'],
  'Morning Snack': ['Granola Bar', 'Fruit', 'Yogurt'],
  'Afternoon Snack': ['Hummus with Veggies', 'Protein Shake', 'Fruit'],
};

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
        title: Text(
          plan.title,
          style:
              TextStyle(color: Colors.white), // Set title text color to white
        ),
        backgroundColor: Colors.black, // Set app bar background color to black
        iconTheme:
            IconThemeData(color: Colors.white), // Set back arrow color to white
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                // Navigate to customization screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomizePlanScreen(plan: plan),
                  ),
                );
              },
              child: Text('Customize Plan'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomizePlanScreen extends StatefulWidget {
  final DietaryPlan plan;

  CustomizePlanScreen({required this.plan});

  @override
  _CustomizePlanScreenState createState() => _CustomizePlanScreenState();
}

class _CustomizePlanScreenState extends State<CustomizePlanScreen> {
  late Map<String, List<String>> selectedMeals;

  @override
  void initState() {
    super.initState();
    selectedMeals = {for (var meal in widget.plan.meals) meal: []};
  }

  void _savePlan() {
    setState(() {
      widget.plan.meals = selectedMeals.entries
          .where((entry) => entry.value.isNotEmpty)
          .map((entry) => '${entry.key}: ${entry.value.join(', ')}')
          .toList();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize ${widget.plan.title}'),
        backgroundColor: Colors.black, // Set app bar background color to black
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Meals:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: mealSuggestions.keys.length,
                itemBuilder: (context, index) {
                  String mealType = mealSuggestions.keys.elementAt(index);
                  return ExpansionTile(
                    title: Text(mealType),
                    children: mealSuggestions[mealType]!
                        .map((meal) => CheckboxListTile(
                              title: Text(meal),
                              value: selectedMeals[mealType]?.contains(meal) ??
                                  false,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedMeals[mealType]?.add(meal);
                                  } else {
                                    selectedMeals[mealType]?.remove(meal);
                                  }
                                });
                              },
                              activeColor:
                                  Colors.red, 
                            ))
                        .toList(),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePlan,
              child: Text('Save Plan'),
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
