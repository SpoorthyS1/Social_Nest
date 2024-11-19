import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:social_nest/component/locations.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocationService locationService = LocationService();

  String? address = null;
  String? sublocality = 'Fetching location';
  Position? currentPosition = null;

  Future<void> fetchLocation() async {
    try {
      // Fetch the device's location.
      Position position = await locationService.getGeoLocationPosition();

      // Convert the location to a human-readable address and sublocality.
      String fetchedAddress =
          await locationService.getAddressFromLatLong(position);
      String fetchedSublocality =
          await locationService.getSublocality(position);

      setState(() {
        currentPosition = position;
        address = fetchedAddress;
        sublocality = fetchedSublocality;
      });

      // Show the fetched address in a dialog
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

      // Show an error dialog
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

  int _currentIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text('Services Screen')),
    Center(child: Text('Settings Screen')),
    Center(child: Text('Home Screen')),
  ];

  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 48, 239),
        elevation: 8.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/nest.jpg'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Social Nest',
              style: TextStyle(letterSpacing: 1.3),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        actions: [
          IconButton.filled(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              // fill: 8,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                          margin: EdgeInsets.only(top: 0.5),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(
                                255, 246, 225, 249), // Light purple background
                            border: Border.all(
                              color: Color.fromARGB(255, 228, 13,
                                  244), // Dark purple border color
                              width: 2, // Border width
                            ),
                            // borderRadius:
                            //     BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.edit_location_outlined),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  "Change Location",
                                  style: TextStyle(),
                                ),
                                Icon(Icons.arrow_drop_down_sharp)
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: fetchLocation,
                        child: Text('$sublocality',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 16, 118, 89))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 0.0),
                  width: 185.0,
                  height: 35.0,
                  child: TextField(
                    cursorWidth: 1,
                    controller: myController,
                    decoration: InputDecoration(
                      hintText: "Search here",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.design_services),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat), // Changed to a unique icon
            label: 'chat',
          ),
        ],
      ),
    );
  }
}
