import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe_provider.dart';
import './RecipeDetailScreen.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favorite Recipes')),
      body: ListView.builder(
        itemCount: recipeProvider.favorites.length,
        itemBuilder: (ctx, index) {
          final recipe = recipeProvider.favorites[index];
          return ListTile(
            title: Text(recipe.title),
            leading: Image.network(recipe.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => RecipeDetailScreen(recipe),
              ));
            },
          );
        },
      ),
    );
  }
}
