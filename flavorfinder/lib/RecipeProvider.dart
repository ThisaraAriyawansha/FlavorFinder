import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Recipe {
  final String name;
  final String image;
  final String description;
  final String instructions;

  Recipe({
    required this.name,
    required this.image,
    required this.description,
    required this.instructions,
  });
}

class MyApp extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Chicken Curry',
      image: 'Chicken.jpg',
      description: 'Spicy chicken curry with coconut milk',
      instructions:
          'Step 1: Fry onions, garlic, and spices\nStep 2: Add chicken and cook until brown\nStep 3: Add coconut milk and simmer until chicken is tender',
    ),
    Recipe(
      name: 'Lamprais',
      image: 'lamprais.jpg',
      description: 'Rice and mixed meat cooked in banana leaf',
      instructions:
          'Step 1: Cook rice and mixed meat curry\nStep 2: Wrap in banana leaf and bake\nStep 3: Serve with sambol and fried ash plantains',
    ),
    Recipe(
      name: 'Hoppers',
      image: 'Hoppers.jpeg',
      description: 'Traditional Sri Lankan pancakes made from rice flour',
      instructions:
          'Step 1: Prepare batter with rice flour and coconut milk\nStep 2: Pour batter into hopper pans and cook\nStep 3: Serve with curry or sambol',
    ),
    Recipe(
      name: 'Fish Ambul Thiyal',
      image: 'fish.jpg',
      description: 'Sour and spicy fish curry with goraka paste',
      instructions:
          'Step 1: Marinate fish with spices and goraka paste\nStep 2: Cook with onions, garlic, and curry leaves\nStep 3: Simmer until fish is cooked and sauce thickens',
    ),
    Recipe(
      name: 'Kottu Roti',
      image: 'kottu.jpg',
      description: 'Chopped flatbread stir-fried with vegetables and egg',
      instructions:
          'Step 1: Chop roti into pieces\nStep 2: Stir-fry with vegetables, egg, and spices\nStep 3: Serve hot with curry sauce',
    ),
    Recipe(
      name: 'Watalappam',
      image: 'Watalappam.jpg',
      description: 'Coconut custard pudding with jaggery and spices',
      instructions:
          'Step 1: Mix coconut milk, jaggery, and spices\nStep 2: Steam until set\nStep 3: Serve chilled with cashew nuts and raisins',
    ),
    Recipe(
      name: 'Sri Lankan Rice and Curry',
      image: 'curry.png',
      description: 'Assorted curries served with rice',
      instructions:
          'Step 1: Prepare multiple curries with vegetables, meat, and seafood\nStep 2: Serve with rice and accompaniments like sambol and papadam\nStep 3: Enjoy the flavors of Sri Lankan cuisine!',
    ),
    Recipe(
      name: 'Milk Rice',
      image: 'Milk-Rice.jpg',
      description: 'Traditional rice dish cooked in coconut milk',
      instructions:
          'Step 1: Cook rice in coconut milk until creamy\nStep 2: Serve with lunu miris or jaggery\nStep 3: A staple dish for festive occasions in Sri Lanka',
    ),
    Recipe(
      name: 'Coconut Sambol',
      image: 'coconut-sambal.jpg',
      description: 'Spicy coconut relish with chili and onions',
      instructions:
          'Step 1: Grate coconut and mix with chili, onions, and lime juice\nStep 2: Season with salt and serve as a condiment\nStep 3: Enhances the flavor of any Sri Lankan meal',
    ),
    // Add more Sri Lankan recipes here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sri Lankan Recipes',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 0, 0), // Custom primary color
        scaffoldBackgroundColor: Colors.grey[900], // Dark background color
        appBarTheme: AppBarTheme(
          backgroundColor:
              const Color.fromARGB(255, 0, 0, 0), // Custom app bar color
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, // Remove debug label
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sri Lankan Recipes',
            style: TextStyle(color: Colors.white), // Change title color here
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white, // Change arrow color here
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          iconTheme: IconThemeData(
              color: Colors.white), // Change arrow color here as well
        ),
        body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeTile(recipe: recipes[index]);
          },
        ),
      ),
    );
  }
}

class RecipeTile extends StatelessWidget {
  final Recipe recipe;

  const RecipeTile({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _showRecipeDetails(context, recipe);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              child: Image.asset(
                recipe.image,
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    recipe.description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRecipeDetails(BuildContext context, Recipe recipe) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: AnimatedPadding(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.all(16.0),
            curve: Curves.easeInOut,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    recipe.image,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                SizedBox(height: 16),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: 1.0,
                  curve: Curves.easeInOut,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        recipe.instructions,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
