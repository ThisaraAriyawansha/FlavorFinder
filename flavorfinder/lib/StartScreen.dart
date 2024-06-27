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
            'Get daily tips for a healthier lifestyle.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
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

extension WidgetModifier on Widget {
  Widget paddedWithShadow() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(5, 5),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: this,
      ),
    );
  }
}
