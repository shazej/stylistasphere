import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String defaultName = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(name: defaultName),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final String name;

  WelcomeScreen({required this.name});

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

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';

  void _loginWithUsernamePassword() {
    if (username == 'barber1' && password == 'barber@1') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    } else {
      final snackBar = SnackBar(
        content: Text('Your entered login is incorrect'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _navigateToForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotPasswordPage(),
      ),
    );
  }

  void _loginWithGoogle() {
    // TODO: Handle Google login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Login with:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loginWithUsernamePassword,
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _loginWithGoogle,
              icon: SvgPicture.asset(
                'assets/images/Google__G__Logo.svg.webp',
                width: 20,
                height: 20,
              ),
              label: Text('Login with Google'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Customize the button color
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _navigateToForgotPassword,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String businessCategory = '';
  String country = '';
  String language = 'English';
  String gender = 'Male';

  void _continueButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PurchasePremiumPlanPage(name: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                // TODO: Implement profile photo editing
              },
              child: CircleAvatar(
                radius: 60,
                // TODO: Replace with actual profile photo
                backgroundImage: AssetImage('images/default_profile_photo.png'),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  businessCategory = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Business Category',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  country = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Country',
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: language,
              onChanged: (value) {
                setState(() {
                  language = value!;
                });
              },
              items: ['English', 'Spanish', 'French', 'German']
                  .map((language) => DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
              decoration: InputDecoration(
                labelText: 'Language',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Gender:',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text('Male'),
                SizedBox(width: 20),
                Radio<String>(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _continueButtonPressed,
              child: Text('Continue'),
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

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Please enter your email address below to receive your OTP number',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement forgot password functionality
              },
              child: Text('Send OTP'),
            ),
          ],
        ),
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

void _buyNowButtonPressed(BuildContext context, String name, String plan) {
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
