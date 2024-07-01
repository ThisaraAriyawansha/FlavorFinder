import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      description:
          'A rich and flavorful curry with tender chicken pieces simmered in a spicy coconut milk sauce. This dish is a staple in Sri Lankan cuisine, often enjoyed with rice or roti.',
      instructions:
          'Step 1: Heat oil in a pan and fry chopped onions, garlic, and ginger until golden brown. Add spices like turmeric, cumin, coriander, and chili powder.\n'
          'Step 2: Add chicken pieces and cook until they turn brown.\n'
          'Step 3: Pour in coconut milk, add salt, and simmer on low heat until the chicken is tender and the sauce thickens.',
    ),
    Recipe(
      name: 'Lamprais',
      image: 'lamprais.jpg',
      description:
          'A traditional Sri Lankan dish with Dutch Burgher origins, Lamprais consists of rice and mixed meat cooked in a banana leaf. This dish is a festive favorite, known for its unique flavor and aroma.',
      instructions:
          'Step 1: Cook rice and prepare a mixed meat curry with chicken, beef, and pork.\n'
          'Step 2: Wrap the cooked rice and meat curry in a banana leaf and bake it in the oven to infuse the flavors.\n'
          'Step 3: Serve with sambol (spicy relish) and fried ash plantains for a complete meal.',
    ),
    Recipe(
      name: 'Hoppers',
      image: 'Hoppers.jpeg',
      description:
          'Hoppers, also known as appam, are traditional Sri Lankan pancakes made from rice flour and coconut milk. They have a crispy edge and a soft, fluffy center, perfect for breakfast or dinner.',
      instructions:
          'Step 1: Prepare the batter by mixing rice flour, coconut milk, a pinch of sugar, and a bit of yeast. Let it ferment for a few hours.\n'
          'Step 2: Heat a hopper pan, pour a ladle of batter, and swirl it around to coat the pan. Cover and cook until the edges are crispy and the center is soft.\n'
          'Step 3: Serve with coconut sambol, curry, or a fried egg for a delicious meal.',
    ),
    Recipe(
      name: 'Fish Ambul Thiyal',
      image: 'fish.jpg',
      description:
          'Fish Ambul Thiyal is a sour and spicy fish curry made with goraka paste, a key ingredient in Sri Lankan cuisine. This dish is known for its tangy flavor and is often enjoyed with rice.',
      instructions:
          'Step 1: Marinate fish pieces with spices, goraka paste (a souring agent), and salt.\n'
          'Step 2: Cook the marinated fish with onions, garlic, curry leaves, and green chilies until the fish is tender and the sauce thickens.\n'
          'Step 3: Serve hot with steamed rice and a side of vegetables.',
    ),
    Recipe(
      name: 'Kottu Roti',
      image: 'kottu.jpg',
      description:
          'Kottu Roti is a popular street food in Sri Lanka, made by stir-frying chopped flatbread with vegetables, eggs, and spices. It is a hearty and flavorful dish, often enjoyed as a quick meal.',
      instructions: 'Step 1: Chop roti (flatbread) into small pieces.\n'
          'Step 2: Stir-fry the chopped roti with vegetables (carrots, cabbage, leeks), scrambled eggs, and spices (curry powder, chili flakes) in a hot skillet.\n'
          'Step 3: Serve hot with a side of curry sauce or gravy.',
    ),
    Recipe(
      name: 'Watalappam',
      image: 'Watalappam.jpg',
      description:
          'Watalappam is a traditional Sri Lankan dessert made from coconut milk, jaggery (palm sugar), and spices like cardamom and nutmeg. This coconut custard pudding is a must-have during festive occasions.',
      instructions:
          'Step 1: Mix coconut milk, jaggery, beaten eggs, and spices (cardamom, nutmeg, cloves) until well combined.\n'
          'Step 2: Pour the mixture into a steaming dish and steam it until set.\n'
          'Step 3: Serve chilled, garnished with cashew nuts and raisins for added texture and flavor.',
    ),
    Recipe(
      name: 'Sri Lankan Rice and Curry',
      image: 'curry.png',
      description:
          'A quintessential Sri Lankan meal, Sri Lankan Rice and Curry is an assortment of curries served with rice. This meal showcases the diverse flavors of Sri Lankan cuisine, featuring vegetable, meat, and seafood curries.',
      instructions:
          'Step 1: Prepare a variety of curries (vegetable curry, chicken curry, fish curry) using local spices and ingredients.\n'
          'Step 2: Serve the curries with steamed rice and accompaniments like sambol (spicy relish) and papadam (crispy lentil crackers).\n'
          'Step 3: Enjoy the rich and diverse flavors of Sri Lankan cuisine in a single meal.',
    ),
    Recipe(
      name: 'Milk Rice',
      image: 'Milk-Rice.jpg',
      description:
          'Milk Rice, or Kiribath, is a traditional Sri Lankan dish cooked in coconut milk. It is often prepared for special occasions and served with spicy accompaniments like lunu miris (chili and onion relish) or sweet treats like jaggery.',
      instructions:
          'Step 1: Cook rice in coconut milk until it becomes creamy and thick.\n'
          'Step 2: Press the cooked rice into a flat dish and let it cool. Cut it into diamond shapes.\n'
          'Step 3: Serve with lunu miris (spicy chili and onion relish) or jaggery (palm sugar) for a traditional Sri Lankan breakfast or snack.',
    ),
    Recipe(
      name: 'Coconut Sambol',
      image: 'coconut-sambal.jpg',
      description:
          'Coconut Sambol is a spicy coconut relish made with grated coconut, chili, onions, and lime juice. It is a versatile condiment that enhances the flavor of any Sri Lankan meal, adding a spicy and tangy kick.',
      instructions:
          'Step 1: Grate fresh coconut and mix it with finely chopped onions, green chilies, and lime juice.\n'
          'Step 2: Season the mixture with salt and a dash of chili powder for extra heat.\n'
          'Step 3: Serve as a condiment with rice, roti, or any curry dish to add a burst of flavor.',
    ),
  ];

  Future<List<Recipe>> _fetchRecipes() async {
    await Future.delayed(Duration(seconds: 2));
    return recipes;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.redAccent,
        hintColor: Colors.redAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recipes'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black, // Set AppBar background color to black
        ),
        body: FutureBuilder<List<Recipe>>(
          future: _fetchRecipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.redAccent,
                  size: 50.0,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No recipes found'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return RecipeTile(recipe: snapshot.data![index]);
                },
              );
            }
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
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            recipe.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          recipe.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          recipe.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetails(recipe: recipe),
            ),
          );
        },
      ),
    );
  }
}

// RecipeDetails screen to show detailed recipe information
class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetails({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black, // Set AppBar background color to black
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  recipe.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                recipe.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                recipe.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Instructions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                recipe.instructions,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
