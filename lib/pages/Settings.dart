import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsPage(); // Directly return the SettingsPage
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, color: Colors.white), // Added settings icon
            SizedBox(width: 8.0),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 24.0, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 218, 78, 243),
        // Default back button will appear here
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Account Section
          SectionHeader(title: 'Account'),
          SettingsTile(
            title: 'Edit Account',
            icon: Icons.edit,
            iconColor: Colors.purple,
            onTap: () {
              _navigateTo(context, 'Edit Account');
            },
          ),
          SettingsTile(
            title: 'Personal Info',
            icon: Icons.person,
            iconColor: Colors.deepPurple,
            onTap: () {
              _navigateTo(context, 'Personal Info');
            },
          ),
          Divider(),

          // General Section
          SectionHeader(title: 'General'),
          SettingsTile(
            title: 'User Terms',
            icon: Icons.description,
            iconColor: Colors.indigo,
            onTap: () {
              _navigateTo(context, 'User Terms');
            },
          ),
          SettingsTile(
            title: 'Cookies',
            icon: Icons.cookie,
            iconColor: Colors.pinkAccent,
            onTap: () {
              _navigateTo(context, 'Cookies');
            },
          ),
          SettingsTile(
            title: 'Terms & Conditions',
            icon: Icons.rule,
            iconColor: Colors.purple,
            onTap: () {
              _navigateTo(context, 'Terms & Conditions');
            },
          ),
          Divider(),

          // Help Section
          SectionHeader(title: 'Help'),
          SettingsTile(
            title: 'User Guide',
            icon: Icons.help_outline,
            iconColor: Colors.teal,
            onTap: () {
              _navigateTo(context, 'User Guide');
            },
          ),
          SettingsTile(
            title: 'Contact Support',
            icon: Icons.support,
            iconColor: Colors.greenAccent,
            onTap: () {
              _navigateTo(context, 'Contact Support');
            },
          ),
          Divider(),

          // Security Section
          SectionHeader(title: 'Security'),
          SettingsTile(
            title: 'Change Password',
            icon: Icons.lock,
            iconColor: Colors.redAccent,
            onTap: () {
              _navigateTo(context, 'Change Password');
            },
          ),
          SettingsTile(
            title: 'Enable Two-Factor Authentication',
            icon: Icons.security,
            iconColor: Colors.cyan,
            onTap: () {
              _navigateTo(context, 'Two-Factor Authentication');
            },
          ),
          Divider(),

          // Notifications Section
          SectionHeader(title: 'Notifications'),
          SettingsTile(
            title: 'Push Notifications',
            icon: Icons.notifications,
            iconColor: Colors.orangeAccent,
            onTap: () {
              _navigateTo(context, 'Push Notifications');
            },
          ),
          SettingsTile(
            title: 'Email Notifications',
            icon: Icons.email,
            iconColor: Colors.blueAccent,
            onTap: () {
              _navigateTo(context, 'Email Notifications');
            },
          ),
          Divider(),

          // Privacy Section
          SectionHeader(title: 'Privacy'),
          SettingsTile(
            title: 'Privacy Policy',
            icon: Icons.privacy_tip,
            iconColor: Colors.deepPurpleAccent,
            onTap: () {
              _navigateTo(context, 'Privacy Policy');
            },
          ),
          SettingsTile(
            title: 'Data Sharing Preferences',
            icon: Icons.share,
            iconColor: Colors.lime,
            onTap: () {
              _navigateTo(context, 'Data Sharing Preferences');
            },
          ),
        ],
      ),
    );
  }

  // Navigation method to simulate action when an option is tapped
  void _navigateTo(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(title: title),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal.withOpacity(0.5), width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
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

  const DetailsPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Text(
          'This is the $title page.',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
