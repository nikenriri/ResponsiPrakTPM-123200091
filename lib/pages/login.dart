import 'package:flutter/material.dart';
import 'package:responsi/pages/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String user = "";
  String pass = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  TextField(
                    onChanged: (value) {
                      user = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Username',
                      hintText: 'Username',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 25
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      pass = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: 'Password',
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 25
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String text = "";
                if (user == 'user' && pass == 'user123') {
                  setState(() {
                    text = 'Login Success';
                    isLoginSuccess = true;
                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return const DashboardPage();
                  }));
                } else {
                  setState(() {
                    text = 'Login Failed';
                    isLoginSuccess = false;
                  });
                }
                SnackBar snackBar = SnackBar(content: Text(text), backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Log In'),
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,

                ),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                ),
                backgroundColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
