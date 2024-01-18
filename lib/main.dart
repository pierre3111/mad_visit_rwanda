import 'package:flutter/material.dart';

void main() {
  runApp(const VisitRwandaApp());
}

class VisitRwandaApp extends StatelessWidget {
  const VisitRwandaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      title: 'Visit Rwanda',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      print("Logging in with email: $email, password: $password");
      // Navigate or perform other actions after successful login
    } else {
      // Show an error message for invalid input
      print("Please enter both email and password.");
    }
  }

  void _forgetPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Recovery'),
          content: Column(
            children: [
              Text('Enter your email to reset your password:'),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Implement the logic for sending a password reset email
                print('Sending password reset email...');
                Navigator.of(context).pop();
              },
              child: Text('Reset Password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _goToRegisterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/rwanda.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        'https://pbs.twimg.com/profile_images/999180694088704000/FuSqjpJD_400x400.jpg',
                        height: 200,
                      ),
                      Image.asset(
                        'assets/images/R.jpeg',
                        height: 100,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Login page',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Center(child: Text('Login')),
                  ),
                ),
                TextButton(
                  onPressed: () => _forgetPassword(context),
                  child: Text("Forgot Password"),
                ),
                ElevatedButton(
                  onPressed: () => _goToRegisterPage(context),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(child: Text('Register')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordsMatch = true;

  String? _validatePassword(String value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var _submitRegistration;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register Page'),

              Image.asset(
                'assets/image/signup.png',
                height: 100,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  errorText: !_passwordsMatch ? 'Passwords do not match' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                obscureText: true,
                onChanged: (value) {
                  // Update _passwordsMatch when confirm password changes
                  setState(() {
                    _passwordsMatch = value == _passwordController.text;
                  });
                },
              ),
              SizedBox(
                height: 16.0,
              ),

              //AHO NARINJYEZE
              OutlinedButton(
                onPressed: _passwordsMatch ? _submitRegistration : null,
                style: OutlinedButton.styleFrom(
                  primary: Colors.black, // Color when pressed
                  side: BorderSide(color: Colors.black), // Border color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: Text('Submit')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
