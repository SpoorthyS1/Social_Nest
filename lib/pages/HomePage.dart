import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:social_nest/component/carousel_cards.dart';
import 'package:social_nest/component/locations.dart';
import 'package:social_nest/pages/Notifications.dart';
import 'package:social_nest/pages/Profile.dart';
import 'package:social_nest/pages/Services.dart';
import 'package:social_nest/pages/Settings.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocationService locationService = LocationService();

  String? address = null;
  String? sublocality = 'Access location';
  Position? currentPosition = null;

  int _selectedIndex = 0;

  Future<void> fetchLocation() async {
    try {
      Position position = await locationService.getGeoLocationPosition();
      String fetchedAddress =
          await locationService.getAddressFromLatLong(position);
      String fetchedSublocality =
          await locationService.getSublocality(position);

      setState(() {
        currentPosition = position;
        address = fetchedAddress;
        sublocality = fetchedSublocality;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Location Info'),
          content: Text('Address: $address'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      print('Error fetching location: $e');

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Unable to fetch location. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

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
          MaterialPageRoute(builder: (context) => Notifications()),
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 8.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/nest.jpg'),
            ),
            SizedBox(width: 10.0),
            Text(
              'Social Nest',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            SizedBox(height: 20),
          ],
        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()),
                );
              },
              icon: Icon(
                Icons.person,
                color:
                    Theme.of(context).floatingActionButtonTheme.foregroundColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 2, left: 1.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: fetchLocation,
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context)
                                .bottomNavigationBarTheme
                                .backgroundColor,
                            // Text color for light/dark theme
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.edit_location_outlined,
                                      color: Theme.of(context).iconTheme.color),
                                  SizedBox(width: 3.0),
                                  Text(
                                    "Fetch Location",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .primaryColor, // Color for text based on theme
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Theme.of(context)
                                        .primaryColorLight, // Light primary color for dropdown icon
                                  ),
                                ],
                              ),
                              Text(
                                '$sublocality',
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white70 // For dark theme
                                      : Colors.black87, // For light theme
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(width: 3),
              Container(
                margin: EdgeInsets.only(left: 5.0, top: 0.0),
                width: 210.0,
                height: 45.0,
                child: TextField(
                  cursorWidth: 1,
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: "Search here",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search,
                        color: Theme.of(context).primaryColor),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Hi, [Name]! Ready to make a explore your COMMUNITY?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white // For dark theme
                        : Colors.black87,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'You’re currently in ${sublocality ?? 'a nearby city'}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white // For dark theme
                        : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: TallCarouselCards(),
          ),
          SizedBox(height: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.admin_panel_settings),
                  title: Text('Contact Community Admin'),
                  onTap: () {
                    // Logic for contacting admin
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Ask for Help'),
                  onTap: () {
                    // Logic for asking help
                  },
                ),
                ListTile(
                  leading: Icon(Icons.chat),
                  title: Text('Start Chat with a Group'),
                  onTap: () {
                    // Logic for starting group chat
                  },
                ),
              ],
            ),
          );
        },
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Icon(
          Icons.more_vert,
          color: Theme.of(context).floatingActionButtonTheme.foregroundColor,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
      ),
    );
  }
}
