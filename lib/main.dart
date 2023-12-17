// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projekweb/View/airingmovie.dart';
import 'package:projekweb/View/homepage.dart';
import 'package:projekweb/View/profile.dart';
import 'package:projekweb/View/splashscreen.dart';
import 'package:projekweb/services/firebase_options.dart';
import 'package:projekweb/View/setting.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => splashscreen(),
        '/appku': (context) => appku(),
        '/allmovie': (context) =>
            AiringMovie(), // Tambahkan rute untuk AllMovie
      },
    );
  }
}

class appku extends StatefulWidget {
  const appku({Key? key});

  @override
  State<appku> createState() => _appkuState();
}

class _appkuState extends State<appku> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          homepage(),
          AiringMovie(),
          ProfilePage(),
          setting(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'All Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Setting',
          // ),
        ],
      ),
    );
  }
}
