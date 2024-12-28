// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class MapPage extends StatefulWidget {
// //   @override
// //   _MapPageState createState() => _MapPageState();
// // }

// // class _MapPageState extends State<MapPage> {
// //   static const CameraPosition _initialPosition = CameraPosition(
// //     target: LatLng(12.971599, 77.594566), // Bangalore coordinates
// //     zoom: 12,
// //   );

// //   GoogleMapController? _mapController;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Map Page'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Card(
// //           elevation: 4.0,
// //           margin: EdgeInsets.all(16.0),
// //           child: SizedBox(
// //             height: 300.0, // Set the height of the map container
// //             child: GoogleMap(
// //               initialCameraPosition: _initialPosition,
// //               myLocationEnabled: true,
// //               myLocationButtonEnabled: true,
// //               onMapCreated: (GoogleMapController controller) {
// //                 _mapController = controller;
// //                 print("Google Map Created");
// //               },
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:geolocator/geolocator.dart';

// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   late GoogleMapController _mapController;
//   final List<Marker> markers = [];
//   final TextEditingController searchController = TextEditingController();

//   static const CameraPosition _initialCameraPosition = CameraPosition(
//     target: LatLng(12.971599, 77.594566), // Bangalore coordinates
//     zoom: 14,
//   );

//   LatLng currentLocation = _initialCameraPosition.target;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     setState(() {
//       currentLocation = LatLng(position.latitude, position.longitude);
//     });
//     _mapController.animateCamera(
//       CameraUpdate.newLatLng(currentLocation),
//     );
//     markers.add(
//       Marker(
//         markerId: MarkerId("currentLocation"),
//         position: currentLocation,
//         infoWindow: InfoWindow(
//           title: "You are here",
//         ),
//       ),
//     );
//   }

//   void _onSearchSubmitted(String query) async {
//     if (query.isEmpty) return;

//     final places = GoogleMapsPlaces(apiKey: "AIzaSyC4Zeh-wmUI0HQEBu45aKkpCxxLG383Rw0");
//     final response = await places.searchByText(
//       query,
//       location: Location(lat: currentLocation.latitude, lng: currentLocation.longitude), // Corrected line
//       radius: 5000,
//     );

//     if (response.status == "OK" && response.results.isNotEmpty) {
//       setState(() {
//         markers.clear();
//       });

//       for (var result in response.results) {
//         final LatLng location = LatLng(
//           result.geometry!.location.lat,
//           result.geometry!.location.lng,
//         );

//         setState(() {
//           markers.add(
//             Marker(
//               markerId: MarkerId(result.placeId!),
//               position: location,
//               infoWindow: InfoWindow(
//                 title: result.name,
//                 snippet: result.formattedAddress,
//               ),
//             ),
//           );
//         });
//       }

//       final firstResult = response.results.first;
//       _mapController.animateCamera(CameraUpdate.newLatLngZoom(
//         LatLng(firstResult.geometry!.location.lat,
//             firstResult.geometry!.location.lng),
//         14,
//       ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("No results found for \"$query\"")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Your Map"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 hintText: "Search nearby places (e.g., restaurants)",
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               onSubmitted: _onSearchSubmitted,
//             ),
//           ),
//           Expanded(
//             child: GoogleMap(
//               initialCameraPosition: _initialCameraPosition,
//               markers: Set<Marker>.of(markers),
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//               onMapCreated: (controller) {
//                 _mapController = controller;
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
