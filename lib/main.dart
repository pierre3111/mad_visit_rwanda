import 'package:flutter/material.dart';

void main() {
  runApp(const VisitRwandaApp());
}

class VisitRwandaApp extends StatelessWidget {
  const VisitRwandaApp({super.key});

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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // TODO: implement login logic
  void _login() {
    print("login");
  }

  // TODO: implement forget password logic
  void _forget_password() {
    print("forget password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://pbs.twimg.com/profile_images/999180694088704000/FuSqjpJD_400x400.jpg'),
                        height: 200,
                      ),
                      Image(
                        image: AssetImage('assets/images/rwanda_map.png'),
                        height: 100,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Login Page',
                  // Todo:  modify login page fonts to match with Visit Rwanda logo fonts
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black87,
                    onPrimary: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    )),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text('Login'),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _forget_password,
                  child: const Text('Forgot Password?'),
                ),
              ]),
        ),
      ),
    );
  }
}

// Challenges

// TODO: 1. Add a background image to the login page
// TODO: 2. Add custom fonts to the login page
// TODO: 3. Add Custom theme (colors) for the app
// TODO: 4. Add a register button to the login page
// TODO: 5. Add a register page
