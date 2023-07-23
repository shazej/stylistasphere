import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/stylistasphere_logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Stylistasphere',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PurchasePremiumPlanPage(name: name),
                  ),
                );
              },
              child: Icon(Icons.arrow_forward),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PurchasePremiumPlanPage extends StatelessWidget {
  final String name;

  PurchasePremiumPlanPage({required this.name});

  void _buyNowButtonPressed(BuildContext context, String plan) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMd().format(now);

    print('User: $name');
    print('Plan: $plan');
    print('Date: $formattedDate');

    // TODO: Implement the logic to record the user's plan selection in your system

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Premium Plan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose a plan:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            PlanCard(
              title: 'Monthly Plan',
              price: '80 QAR per month',
              buttonText: 'Select',
              onPressed: () => _buyNowButtonPressed(context, 'Monthly Plan'),
            ),
            SizedBox(height: 10),
            PlanCard(
              title: 'Mobile App + Desktop 1 Year',
              price: '1152 QAR',
              buttonText: 'Select',
              onPressed: () =>
                  _buyNowButtonPressed(context, 'Mobile App + Desktop 1 Year'),
            ),
            SizedBox(height: 10),
            PlanCard(
              title: 'On Sale - Lifetime Purchase',
              price: '2500 QAR',
              buttonText: 'Select',
              onPressed: () =>
                  _buyNowButtonPressed(context, 'On Sale - Lifetime Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String buttonText;
  final VoidCallback onPressed;

  const PlanCard({
    required this.title,
    required this.price,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Center(
        child: Text('Purchase confirmed!'),
      ),
    );
  }
}

class CongratulationsPage extends StatelessWidget {
  void _continueButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PurchasePremiumPlanPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Congratulations'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Your OTP verification is successful.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _continueButtonPressed(context),
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

void _buyNowButtonPressed(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PurchasePremiumPlanPage(),
    ),
  );
}
