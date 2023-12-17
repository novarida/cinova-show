import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text('Setting Application'),
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
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 22,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.lock_outline_rounded),
                    title: Text('Privacy and Security'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => setting(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications_active),
                    title: Text('Notifications'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => setting(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.storage_rounded),
                    title: Text('Data and Storage'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => setting(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add_to_home_screen_rounded),
                    title: Text('Use Systems Theme'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => setting(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language_outlined),
                    title: Text('Language'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => setting(),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
