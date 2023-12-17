import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projekweb/screens/loginpage.dart';

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
            // Image.asset('assets/images/Cinova Show.png'),
            Image.asset('assets/images/splash.png'),
            SizedBox(height: 10),
            Text(
              'Cinova Show',
              style: GoogleFonts.greatVibes(
                fontSize: 50
              )
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => loginpage(),
                  ),
                );
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size.fromHeight(50), // Sesuaikan tinggi sesuai kebutuhan
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 158, 61, 200)),
              ),
              child: Text(
                "Let's Watching",
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