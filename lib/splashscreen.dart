import 'package:flutter/material.dart';
import 'package:projekweb/View/homepage.dart';
import 'package:projekweb/main.dart';

class splashscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushReplacementNamed(context, '/appku');
    // });
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash.png'),
            SizedBox(height: 10),
            Text(
              'Journey Application',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => appku(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[700],
                // shadowColor: Color(20),
              ),
              child: Text(
                "Let's Travelling",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}