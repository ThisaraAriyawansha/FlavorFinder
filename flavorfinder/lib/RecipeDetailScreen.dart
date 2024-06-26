import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe_provider.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  RecipeDetailScreen(this.recipe);

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          IconButton(
            icon: Icon(
              recipeProvider.favorites.contains(recipe) ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              recipeProvider.toggleFavorite(recipe);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(recipe.imageUrl),
            SizedBox(height: 10),
            Text('Ingredients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ...recipe.ingredients.map((ingredient) => Text(ingredient)).toList(),
            SizedBox(height: 10),
            Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(recipe.instructions),
          ],
        ),
      ),
    );
  }
}
