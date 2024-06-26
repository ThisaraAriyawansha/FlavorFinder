import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> _favorites = [];

  List<Recipe> get recipes => _recipes;
  List<Recipe> get favorites => _favorites;

  Future<void> fetchRecipes() async {
    final response = await http.get(Uri.parse('https://api.spoonacular.com/recipes/complexSearch?apiKey=YOUR_API_KEY'));
    if (response.statusCode == 200) {
      _recipes = json.decode(response.body)['results']
          .map<Recipe>((data) => Recipe.fromJson(data))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  void toggleFavorite(Recipe recipe) {
    if (_favorites.contains(recipe)) {
      _favorites.remove(recipe);
    } else {
      _favorites.add(recipe);
    }
    notifyListeners();
  }
}

class Recipe {
  final String title;
  final String imageUrl;
  final String instructions;
  final List<String> ingredients;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.instructions,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      imageUrl: json['image'],
      instructions: json['instructions'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }
}
