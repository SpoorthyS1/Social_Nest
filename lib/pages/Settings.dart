// import 'package:flutter/material.dart';

// class Settings extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SettingsPage(); // Directly return the SettingsPage
//   }
// }

// class SettingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.settings, color: Colors.white), // Added settings icon
//             SizedBox(width: 8.0),
//             Text(
//               'Settings',
//               style: TextStyle(
//                 fontSize: 24.0, // Increased font size
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: const Color.fromARGB(255, 218, 78, 243),
//         // Default back button will appear here
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: [
//           // Account Section
//           SectionHeader(title: 'Account'),
//           SettingsTile(
//             title: 'Edit Account',
//             icon: Icons.edit,
//             iconColor: Colors.purple,
//             onTap: () {
//               _navigateTo(context, 'Edit Account');
//             },
//           ),
//           SettingsTile(
//             title: 'Personal Info',
//             icon: Icons.person,
//             iconColor: Colors.deepPurple,
//             onTap: () {
//               _navigateTo(context, 'Personal Info');
//             },
//           ),
//           Divider(),

//           // General Section
//           SectionHeader(title: 'General'),
//           SettingsTile(
//             title: 'User Terms',
//             icon: Icons.description,
//             iconColor: Colors.indigo,
//             onTap: () {
//               _navigateTo(context, 'User Terms');
//             },
//           ),
//           SettingsTile(
//             title: 'Cookies',
//             icon: Icons.cookie,
//             iconColor: Colors.pinkAccent,
//             onTap: () {
//               _navigateTo(context, 'Cookies');
//             },
//           ),
//           SettingsTile(
//             title: 'Terms & Conditions',
//             icon: Icons.rule,
//             iconColor: Colors.purple,
//             onTap: () {
//               _navigateTo(context, 'Terms & Conditions');
//             },
//           ),
//           Divider(),

//           // Help Section
//           SectionHeader(title: 'Help'),
//           SettingsTile(
//             title: 'User Guide',
//             icon: Icons.help_outline,
//             iconColor: Colors.teal,
//             onTap: () {
//               _navigateTo(context, 'User Guide');
//             },
//           ),
//           SettingsTile(
//             title: 'Contact Support',
//             icon: Icons.support,
//             iconColor: Colors.greenAccent,
//             onTap: () {
//               _navigateTo(context, 'Contact Support');
//             },
//           ),
//           Divider(),

//           // Security Section
//           SectionHeader(title: 'Security'),
//           SettingsTile(
//             title: 'Change Password',
//             icon: Icons.lock,
//             iconColor: Colors.redAccent,
//             onTap: () {
//               _navigateTo(context, 'Change Password');
//             },
//           ),
//           SettingsTile(
//             title: 'Enable Two-Factor Authentication',
//             icon: Icons.security,
//             iconColor: Colors.cyan,
//             onTap: () {
//               _navigateTo(context, 'Two-Factor Authentication');
//             },
//           ),
//           Divider(),

//           // Notifications Section
//           SectionHeader(title: 'Notifications'),
//           SettingsTile(
//             title: 'Push Notifications',
//             icon: Icons.notifications,
//             iconColor: Colors.orangeAccent,
//             onTap: () {
//               _navigateTo(context, 'Push Notifications');
//             },
//           ),
//           SettingsTile(
//             title: 'Email Notifications',
//             icon: Icons.email,
//             iconColor: Colors.blueAccent,
//             onTap: () {
//               _navigateTo(context, 'Email Notifications');
//             },
//           ),
//           Divider(),

//           // Privacy Section
//           SectionHeader(title: 'Privacy'),
//           SettingsTile(
//             title: 'Privacy Policy',
//             icon: Icons.privacy_tip,
//             iconColor: Colors.deepPurpleAccent,
//             onTap: () {
//               _navigateTo(context, 'Privacy Policy');
//             },
//           ),
//           SettingsTile(
//             title: 'Data Sharing Preferences',
//             icon: Icons.share,
//             iconColor: Colors.lime,
//             onTap: () {
//               _navigateTo(context, 'Data Sharing Preferences');
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // Navigation method to simulate action when an option is tapped
//   void _navigateTo(BuildContext context, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DetailsPage(title: title),
//       ),
//     );
//   }
// }

// class SectionHeader extends StatelessWidget {
//   final String title;

//   const SectionHeader({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.teal.withOpacity(0.5), width: 1.0),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           title,
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.deepPurple,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SettingsTile extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;
//   final Color iconColor;

//   const SettingsTile({
//     required this.title,
//     required this.icon,
//     required this.onTap,
//     required this.iconColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 4.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.teal.withOpacity(0.3), width: 1.0),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: iconColor),
//         title: Text(title),
//         onTap: onTap,
//       ),
//     );
//   }
// }

// class DetailsPage extends StatelessWidget {
//   final String title;

//   const DetailsPage({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         backgroundColor: Colors.purpleAccent,
//       ),
//       body: Center(
//         child: Text(
//           'This is the $title page.',
//           style: TextStyle(fontSize: 18.0),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:social_nest/pages/HomePage.dart';
import 'package:social_nest/pages/Services.dart';
import 'package:social_nest/pages/foodOptions.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsPage();
  }
}

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
     int _selectedIndex = 3;

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Services()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FoodOptionsPage(userId: '',)),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context), // Go back to the previous screen
        ),
        backgroundColor: const Color(0xFF6C63FF), // Tailored to match the theme
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Account Section
          _buildSectionHeader('Account'),
          _buildSettingsTile(
            context,
            title: 'Edit Account',
            icon: Icons.edit,
            iconColor: Colors.blue,
          ),
          _buildSettingsTile(
            context,
            title: 'Personal Info',
            icon: Icons.person,
            iconColor: Colors.deepPurple,
          ),
          Divider(color: Colors.grey[300]),

          // General Section
          _buildSectionHeader('General'),
          _buildSettingsTile(
            context,
            title: 'User Terms',
            icon: Icons.description,
            iconColor: Colors.indigo,
          ),
          _buildSettingsTile(
            context,
            title: 'Cookies',
            icon: Icons.cookie,
            iconColor: Colors.pinkAccent,
          ),
          _buildSettingsTile(
            context,
            title: 'Terms & Conditions',
            icon: Icons.rule,
            iconColor: Colors.purple,
          ),
          Divider(color: Colors.grey[300]),

          // Notifications Section
          _buildSectionHeader('Notifications'),
          _buildSettingsTile(
            context,
            title: 'Push Notifications',
            icon: Icons.notifications,
            iconColor: Colors.orangeAccent,
          ),
          _buildSettingsTile(
            context,
            title: 'Email Notifications',
            icon: Icons.email,
            iconColor: Colors.blueAccent,
          ),
        ],
      ),
    bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service_sharp),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Donation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ));
  }

  // Reusable method to build section headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF6C63FF),
        ),
      ),
    );
  }

  // Reusable method to build settings tiles
  Widget _buildSettingsTile(BuildContext context,
      {required String title, required IconData icon, required Color iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16.0),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(title: title),
          ),
        );
      },
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color(0xFF6C63FF), // Consistent with theme
      ),
      body: Center(
        child: Text(
          'This is the $title page.',
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
     );
  }
}
