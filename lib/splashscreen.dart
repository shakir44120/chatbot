import 'package:chatbot/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart'; // Import the package

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPosition = 0; // Variable to track current position of dots

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();
    _navigateToHome();
  }

  void _startLoadingAnimation() {
    // Simulate a loading animation by updating the dots indicator position
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _currentPosition = (_currentPosition + 1) % 3;
        });
        _startLoadingAnimation();
      }
    });
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              'images/appstore.png', // Path to your logo image
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            // App Title
            Center(
              child: const Text(
                'CHATBOT',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Dots loading indicator
            DotsIndicator(
              dotsCount: 4,
              position: _currentPosition.toDouble(), // Convert to double
              decorator: DotsDecorator(
                color: Colors.white54, // Inactive color
                activeColor: Colors.white, // Active color
              ),
            ),
          ],
        ),
      ),
    );
  }
}