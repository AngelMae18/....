import 'package:flutter/material.dart';

void main() {
  runApp(MoodClickApp());
}

class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: AppDrawer(), // Add the drawer to the scaffold
      body: Center(child: Text('Home Screen')),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Nickname'),
            accountEmail: Text('Welcome to MoodClick'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Divider(),
          DrawerItem(
            title: 'Home',
            icon: Icons.home,
            onTap: () {
              // Navigate to home
              Navigator.pop(context); // Close the drawer
            },
          ),
          DrawerItem(
            title: 'Messages',
            icon: Icons.message,
            onTap: () {
              // Navigate to messages
              Navigator.pop(context); // Close the drawer
            },
          ),
          DrawerItem(
            title: 'Contact for Counselling',
            icon: Icons.contact_phone,
            onTap: () {
              // Navigate to contact for counselling
              Navigator.pop(context); // Close the drawer
            },
          ),
          DrawerItem(
            title: 'Terms and conditions',
            icon: Icons.description,
            onTap: () {
              // Navigate to terms and conditions
              Navigator.pop(context); // Close the drawer
            },
          ),
          DrawerItem(
            title: 'Privacy policy',
            icon: Icons.privacy_tip,
            onTap: () {
              // Navigate to privacy policy
              Navigator.pop(context); // Close the drawer
            },
          ),
          Divider(),
          DrawerItem(
            title: 'Logout',
            icon: Icons.logout,
            onTap: () {
              // Handle logout
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
