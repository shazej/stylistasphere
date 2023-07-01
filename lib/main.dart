import 'package:flutter/material.dart';

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

class WelcomeScreen extends StatelessWidget {
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
                    builder: (context) => LoginScreen(),
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
            ElevatedButton(
              onPressed: () {
                // TODO: Handle Google login
              },
              child: Text('Login with Google'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle Facebook login
              },
              child: Text('Login with Facebook'),
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
        builder: (context) => OtpVerificationPage(),
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

class OtpVerificationPage extends StatefulWidget {
  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String pin = '';

  void _verifyButtonPressed() {
    if (pin.length == 4) {
      // TODO: Implement OTP verification logic
      print('OTP Verified');
    } else {
      final snackBar = SnackBar(
        content: Text('Please enter a valid 4-digit PIN'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter the 4-digit PIN sent to your email:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  pin = value;
                });
              },
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecoration(
                labelText: 'PIN',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyButtonPressed,
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}