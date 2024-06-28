import 'package:flutter/material.dart';

// Define a class to represent a dietary plan
class DietaryPlan {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  List<String> meals; // Example list of meals in the plan

  DietaryPlan({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.meals,
  });
}

// Example data for pre-made dietary plans
List<DietaryPlan> preMadePlans = [
  DietaryPlan(
    title: 'Weight Loss Plan',
    description: 'Designed to help you lose weight.',
    icon: Icons.fitness_center,
    color: Colors.red,
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
  ),
  DietaryPlan(
    title: 'Muscle Gain Plan',
    description: 'Tailored to support muscle growth and recovery.',
    icon: Icons.fitness_center,
    color: Colors.green,
    meals: ['Breakfast', 'Morning Snack', 'Lunch', 'Afternoon Snack', 'Dinner'],
  ),
  DietaryPlan(
    title: 'Keto Plan',
    description: 'High fat, low carb diet to help you enter ketosis.',
    icon: Icons.local_dining,
    color: Colors.yellow,
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
  ),
  DietaryPlan(
    title: 'Vegan Plan',
    description: 'Plant-based diet with a variety of healthy meals.',
    icon: Icons.eco,
    color: Colors.green,
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
  ),
  DietaryPlan(
    title: 'Mediterranean Plan',
    description:
        'Inspired by the traditional dietary patterns of the Mediterranean region.',
    icon: Icons.local_dining,
    color: Colors.blue,
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
  ),
  DietaryPlan(
    title: 'Paleo Plan',
    description: 'Focuses on whole foods and eliminates processed foods.',
    icon: Icons.local_dining,
    color: Colors.orange,
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
  ),
  DietaryPlan(
    title: 'Low Carb Plan',
    description: 'Reduces carbohydrate intake to help with weight management.',
    icon: Icons.local_dining,
    color: Colors.deepPurple,
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
  ),
  DietaryPlan(
    title: 'Intermittent Fasting Plan',
    description:
        'Includes specific eating and fasting windows to promote weight loss.',
    icon: Icons.access_time,
    color: Colors.grey,
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
  ),
  DietaryPlan(
    title: 'Diabetic Friendly Plan',
    description: 'Designed to help manage blood sugar levels.',
    icon: Icons.favorite,
    color: Colors.red,
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
  ),
  DietaryPlan(
    title: 'Heart Healthy Plan',
    description:
        'Focuses on foods that are beneficial for cardiovascular health.',
    icon: Icons.favorite,
    color: Colors.blue,
    meals: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Set overall dark theme
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Dietary Plans',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Colors.white), // Arrow icon with white color
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
                'Pre-made Plans',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: preMadePlans.length,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          leading: Icon(
                            preMadePlans[index].icon,
                            color: preMadePlans[index].color,
                          ),
                          title: Text(preMadePlans[index].title),
                          subtitle: Text(preMadePlans[index].description),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlanDetailsScreen(
                                    plan: preMadePlans[index]),
                              ),
                            );
                          },
                        ),
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
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
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
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomizePlanScreen(plan: plan),
                  ),
                );
              },
              icon: Icon(
                Icons.edit,
                color: Colors.redAccent,
              ),
              label: Text(
                'Customize Plan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Initialize selected meals with an empty list for each meal type
    selectedMeals = {
      'Breakfast': [],
      'Lunch': [],
      'Dinner': [],
      'Snacks': [],
      'Morning Snack': [],
      'Afternoon Snack': [],
    };

    // Simulate a delay to show loading animation
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _savePlan() {
    setState(() {
      // Update the plan's meals based on selectedMeals
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
        title: Text(
          'Customize ${widget.plan.title}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: mealSuggestions.length,
                      itemBuilder: (context, index) {
                        String mealType = mealSuggestions.keys.elementAt(index);
                        return ExpansionTile(
                          title: Text(
                            mealType,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                          children: mealSuggestions[mealType]!.map((meal) {
                            return CheckboxListTile(
                              title: Text(
                                meal,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              value: selectedMeals[mealType]!.contains(meal),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedMeals[mealType]!.add(meal);
                                  } else {
                                    selectedMeals[mealType]!.remove(meal);
                                  }
                                });
                              },
                              activeColor: Colors.redAccent,
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _savePlan,
                    icon: Icon(
                      Icons.save,
                      color: Colors.redAccent,
                    ),
                    label: Text(
                      'Save Plan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
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
