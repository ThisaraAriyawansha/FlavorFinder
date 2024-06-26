import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      title: "Pasta Carbonara",
      description: "Delicious pasta with creamy sauce",
      imageUrl: "https://via.placeholder.com/300",
    ),
    Recipe(
      title: "Chicken Stir Fry",
      description: "Healthy stir-fried chicken with vegetables",
      imageUrl: "https://via.placeholder.com/300",
    ),
    Recipe(
      title: "Chocolate Cake",
      description: "Decadent chocolate cake with icing",
      imageUrl: "https://via.placeholder.com/300",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Image.network(recipe.imageUrl),
              title: Text(recipe.title),
              subtitle: Text(recipe.description),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to recipe detail page if needed
              },
            ),
          );
        },
      ),
    );
  }
}

class Recipe {
  final String title;
  final String description;
  final String imageUrl;

  Recipe({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
