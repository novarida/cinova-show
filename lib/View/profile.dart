import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          'Profile Page',
          style: GoogleFonts.poppins(
            fontSize: 25
          ),
        ),
        centerTitle: true,
        actions: [
          Builder(builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                color: Colors.white,
                icon: Icon(
                  CupertinoIcons.square_arrow_right,
                  size: 34,
                ),
                onPressed: () {},
              ),
            );
          }),
        ],
      ),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple[50],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "Profile Data",
              style: GoogleFonts.breeSerif(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/nova.png'),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Nova Rahma',
                style: GoogleFonts.varelaRound(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            buildProfileItem('Username', 'noparia', Icons.person),
            buildProfileItem('Bio', 'cewenya hali', CupertinoIcons.pencil_ellipsis_rectangle),
            buildProfileItem('Email', 'nopa@gmail.com', Icons.email),
            buildProfileItem('Phone', '0813080807654', Icons.phone),
          ],
        ),
      ),
    );
  }

  Widget buildProfileItem(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        Text(label),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(227, 209, 209, 209),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              SizedBox(width: 20),
              Icon(
                icon,
                color: Colors.grey,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                value,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ],
    );
  }
}
