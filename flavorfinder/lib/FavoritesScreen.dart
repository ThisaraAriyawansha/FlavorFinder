import 'package:flutter/material.dart';
import './HealthTipsScreen.dart';
import './RecipeProvider.dart';
import './nutrition_tracker.dart';
import './DietaryPlanUI.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoaded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 2 * 3.14).animate(_controller);
  }

  void _startLoadingAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(26.0, 32.0, 16.0, 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(
                      Icons.fastfood,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
                SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      'FlavorFinder',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.redAccent,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.redAccent, width: 2.0),
              ),
              width: double.infinity,
              height: 200.0,
              child: Center(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.rotationY(_animation.value),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.restaurant_menu,
                        color: Colors.redAccent,
                        size: 100.0,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildGridItem(Icons.food_bank, 'Nutrition Tracker', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NutritionTracker()),
                  );
                }),
                _buildGridItem(Icons.local_dining, 'Recipes', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                }),
                _buildGridItem(Icons.local_florist, 'Dietary Plan', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DietaryPlanUI()),
                  );
                }),
                _buildGridItem(Icons.lightbulb, 'Health Tips', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthTipsScreen()),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(0, _isLoaded ? 0 : 100, 0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 50.0,
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
