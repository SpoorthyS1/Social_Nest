import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsPage(); // Directly return the SettingsPage
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, color: Colors.white),
            SizedBox(width: 8.0),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 218, 78, 243),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SettingsTile(
            title: 'Account',
            icon: Icons.person,
            iconColor: Colors.purple,
            onTap: () {
              _navigateTo(context, 'Account');
            },
          ),
          SettingsTile(
            title: 'App Language',
            icon: Icons.language,
            iconColor: Colors.blue,
            onTap: () {
              _navigateTo(context, 'App Language');
            },
          ),
          SettingsTile(
            title: 'Theme',
            icon: Icons.format_paint,
            iconColor: Colors.orange,
            onTap: () {
              _navigateTo(context, 'Theme');
            },
          ),
          SettingsTile(
            title: 'App Details',
            icon: Icons.info,
            iconColor: Colors.green,
            onTap: () {
              _navigateTo(context, 'App Details');
            },
          ),
          SettingsTile(
            title: 'Help',
            icon: Icons.help_outline,
            iconColor: Colors.teal,
            onTap: () {
              _navigateTo(context, 'Help');
            },
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(title: title),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal.withOpacity(0.3), width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;

  const DetailsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (title) {
      case 'Account':
        content = ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SettingsTile(
              title: 'Profile',
              icon: Icons.person,
              iconColor: Colors.purple,
              onTap: () {},
            ),
            SettingsTile(
              title: 'Change Password',
              icon: Icons.lock,
              iconColor: Colors.red,
              onTap: () {},
            ),
            SettingsTile(
              title: 'Two-Step Verification',
              icon: Icons.security,
              iconColor: Colors.green,
              onTap: () {},
            ),
          ],
        );
        break;

      case 'App Language':
        content = ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SettingsTile(
              title: 'English',
              icon: Icons.language,
              iconColor: Colors.blue,
              onTap: () {},
            ),
            SettingsTile(
              title: 'Kannada',
              icon: Icons.language,
              iconColor: Colors.orange,
              onTap: () {},
            ),
            SettingsTile(
              title: 'Hindi',
              icon: Icons.language,
              iconColor: Colors.pink,
              onTap: () {},
            ),
          ],
        );
        break;

      case 'Theme':
        content = ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SettingsTile(
              title: 'Dark Mode',
              icon: Icons.dark_mode,
              iconColor: Colors.black,
              onTap: () {},
            ),
            SettingsTile(
              title: 'Light Mode',
              icon: Icons.light_mode,
              iconColor: Colors.yellow,
              onTap: () {},
            ),
          ],
        );
        break;

      case 'App Details':
        content = Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App Version: 1.0.0',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Build Number: 100',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'App Information:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'This app is designed to provide users with a seamless and intuitive experience for managing their settings. It includes features for account customization, language preferences, theme selection, and access to helpful resources.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        );
        break;

      case 'Help':
        content = ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SettingsTile(
              title: 'User Guide',
              icon: Icons.book,
              iconColor: Colors.blueAccent,
              onTap: () {},
            ),
            SettingsTile(
              title: 'Contact for Help',
              icon: Icons.contact_support,
              iconColor: Colors.green,
              onTap: () {},
            ),
            SettingsTile(
              title: 'Feedback',
              icon: Icons.feedback,
              iconColor: Colors.orange,
              onTap: () {},
            ),
          ],
        );
        break;

      default:
        content = Center(
          child: Text(
            'This is the $title page.',
            style: TextStyle(fontSize: 18.0),
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purpleAccent,
      ),
      body: content,
    );
  }
}
