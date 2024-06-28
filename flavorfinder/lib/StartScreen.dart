import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import './HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
    );
  }
}

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color for the scaffold
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: <Widget>[
              RecipeSection().animate().fadeIn(duration: 500.ms),
              DietPlanSection().animate().fadeIn(duration: 500.ms),
              NutritionTrackSection().animate().fadeIn(duration: 500.ms),
              HealthTipsSection().animate().fadeIn(duration: 500.ms),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: currentPage > 0,
                    child: TextButton(
                      onPressed: () {
                        controller.previousPage(
                          duration: Duration(
                              milliseconds: 800), // Slower transition duration
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4, // Number of pages
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPage == index
                                  ? Colors.redAccent
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentPage < 3) {
                        controller.nextPage(
                          duration: Duration(
                              milliseconds: 800), // Slower transition duration
                          curve: Curves.ease,
                        );
                      } else {
                        // Navigate to MyHomePage with slower animation
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    MyHomePage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = Offset(1.0, 0.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            transitionDuration: Duration(
                                milliseconds:
                                    800), // Slower transition duration
                          ),
                        );
                      }
                    },
                    child: Text(
                      currentPage < 3 ? 'Next' : 'Start',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black87, Colors.black54], // Darker gradient colors
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Food Recipes',
            style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(
            'Discover delicious and healthy recipes.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Text(
            'Explore a variety of recipes that cater to different dietary needs, preferences, and cuisines. From quick and easy meals to gourmet dishes, find the perfect recipe to suit your taste and lifestyle.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Animate(
            effects: [ScaleEffect(duration: 500.ms, curve: Curves.easeInOut)],
            child: Image.asset(
              'FoodRecipes.jpg',
              height: 200,
              fit: BoxFit.cover,
            ).paddedWithShadow(),
          ),
        ],
      ),
    );
  }
}

class DietPlanSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black87, Colors.black54], // Darker gradient colors
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Diet Plans',
            style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(
            'Personalized diet plans for your health goals.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Text(
            'Whether you\'re looking to lose weight, build muscle, or simply maintain a healthy lifestyle, our personalized diet plans are tailored to meet your specific needs. Each plan is designed to provide balanced nutrition and delicious meals.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Animate(
            effects: [ScaleEffect(duration: 500.ms, curve: Curves.easeInOut)],
            child: Image.asset(
              'DietPlans.jpg',
              height: 200,
              fit: BoxFit.cover,
            ).paddedWithShadow(),
          ),
        ],
      ),
    );
  }
}

class NutritionTrackSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black87, Colors.black54], // Darker gradient colors
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nutrition Tracking',
            style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(
            'Track your daily nutritional intake.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Text(
            'Monitor your daily intake of calories, macronutrients, and micronutrients to ensure you\'re meeting your health goals. Our nutrition tracking tools make it easy to log your meals and snacks, giving you insights into your dietary habits.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Animate(
            effects: [ScaleEffect(duration: 500.ms, curve: Curves.easeInOut)],
            child: Image.asset(
              'NutritionTracking.jpg',
              height: 200,
              fit: BoxFit.cover,
            ).paddedWithShadow(),
          ),
        ],
      ),
    );
  }
}

class HealthTipsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black87, Colors.black54], // Darker gradient colors
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Health Tips',
            style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(
            'Stay healthy with daily tips.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Text(
            'Our daily health tips cover a wide range of topics, from fitness and nutrition to mental well-being and preventive care. Stay informed and motivated with practical advice to help you lead a healthier life.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Animate(
            effects: [ScaleEffect(duration: 500.ms, curve: Curves.easeInOut)],
            child: Image.asset(
              'HealthTips.jpg',
              height: 200,
              fit: BoxFit.cover,
            ).paddedWithShadow(),
          ),
        ],
      ),
    );
  }
}

extension PaddingExtension on Widget {
  Widget paddedWithShadow() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.black,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: this,
        ),
      ).animate().scale(duration: 500.ms, curve: Curves.easeInOut),
    );
  }
}
