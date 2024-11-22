import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
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
  String? sublocality = 'Fetching location';
  Position? currentPosition = null;

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

  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Deep Purple for AppBar
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
              style: TextStyle(
                letterSpacing: 1.3,
                color: Colors.white,
              ),
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
              color: Colors.purple.shade200, // Light Purple Background
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
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0.5),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50, // Light Purple background
                        border: Border.all(
                          color: Colors.deepPurple, // Deep Purple border
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.edit_location_outlined,
                                color: Colors.deepPurple),
                            SizedBox(width: 3.0),
                            Text(
                              "Change Location",
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                            Icon(Icons.arrow_drop_down_sharp,
                                color: Colors.deepPurple),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: fetchLocation,
                      child: Text(
                        '$sublocality',
                        style: TextStyle(
                          color: Colors.deepPurple.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 0.0),
                width: 185.0,
                height: 45.0,
                child: TextField(
                  cursorWidth: 1,
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: "Search here",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search,
                        color: const Color.fromARGB(255, 227, 109, 237)),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            color: const Color.fromARGB(
                255, 173, 72, 240), // Footer Background Color
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.design_services),
                  color: Colors.white, // Icons in White
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Services()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.white, // Icons in White
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications_active),
                  color: Colors.white, // Icons in White
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notifications()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
