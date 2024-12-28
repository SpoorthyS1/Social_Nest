// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class WeatherPage extends StatefulWidget {
// //   @override
// //   _WeatherPageState createState() => _WeatherPageState();
// // }

// // class _WeatherPageState extends State<WeatherPage> {
// //   final TextEditingController _searchController = TextEditingController();
// //   Map<String, dynamic>? _weatherData;
// //   bool _isLoading = false;

// //   // Replace with your actual WeatherAPI key
// //   static const String _apiKey = ' 5a91b27918904759a6d75924242712';
// //   static const String _baseUrl = 'https://api.weatherapi.com/v1';

// //   Future<void> _fetchWeather(String location) async {
// //     setState(() {
// //       _isLoading = true;
// //     });

// //     final String url = '$_baseUrl/current.json?key=$_apiKey&q=$location';
// //     try {
// //       final response = await http.get(Uri.parse(url));
// //       if (response.statusCode == 200) {
// //         setState(() {
// //           _weatherData = jsonDecode(response.body);
// //           _isLoading = false;
// //         });
// //       } else {
// //         setState(() {
// //           _isLoading = false;
// //           _weatherData = {'error': 'Could not fetch weather data'};
// //         });
// //       }
// //     } catch (e) {
// //       setState(() {
// //         _isLoading = false;
// //         _weatherData = {'error': e.toString()};
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Weather Information'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _searchController,
// //               decoration: InputDecoration(
// //                 labelText: 'Enter a location',
// //                 suffixIcon: IconButton(
// //                   icon: Icon(Icons.search),
// //                   onPressed: () {
// //                     final location = _searchController.text;
// //                     if (location.isNotEmpty) {
// //                       _fetchWeather(location);
// //                     }
// //                   },
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             if (_isLoading)
// //               CircularProgressIndicator()
// //             else if (_weatherData != null)
// //               _weatherData!.containsKey('error')
// //                   ? Text(
// //                       _weatherData!['error'],
// //                       style: TextStyle(color: Colors.red),
// //                     )
// //                   : Card(
// //                       elevation: 4,
// //                       margin: EdgeInsets.symmetric(vertical: 16.0),
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(16.0),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               'Location: ${_weatherData!['location']['name']}, ${_weatherData!['location']['country']}',
// //                               style: TextStyle(fontWeight: FontWeight.bold),
// //                             ),
// //                             SizedBox(height: 8),
// //                             Text(
// //                               'Temperature: ${_weatherData!['current']['temp_c']}°C',
// //                             ),
// //                             SizedBox(height: 8),
// //                             Text(
// //                               'Condition: ${_weatherData!['current']['condition']['text']}',
// //                             ),
// //                             SizedBox(height: 8),
// //                             Text(
// //                               'Wind: ${_weatherData!['current']['wind_kph']} kph',
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     )
// //             else
// //               Text('Enter a location to fetch weather data'),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'package:geolocator/geolocator.dart';

// // class WeatherPage extends StatefulWidget {
// //   @override
// //   _WeatherPageState createState() => _WeatherPageState();
// // }

// // class _WeatherPageState extends State<WeatherPage> {
// //   String apiKey = ' 5a91b27918904759a6d75924242712';
// //   String location = ''; // Current or searched location
// //   var currentWeather;
// //   var forecast;
// //   TextEditingController _controller = TextEditingController();

// //   @override
// //   void initState() {
// //     super.initState();
// //     getCurrentLocation();
// //   }

// //   // Function to fetch weather data for the given location
// //   fetchWeatherData(String city) async {
// //     final currentWeatherResponse = await http.get(Uri.parse(
// //         'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city'));
// //     final forecastResponse = await http.get(Uri.parse(
// //         'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=7'));

// //     setState(() {
// //       currentWeather = json.decode(currentWeatherResponse.body);
// //       forecast = json.decode(forecastResponse.body);
// //       location = currentWeather['location']['name'];
// //     });
// //   }

// //   // Function to get the current location of the user
// //   getCurrentLocation() async {
// //     Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);
// //     fetchWeatherData('${position.latitude},${position.longitude}');
// //   }

// //   // Function for searching the location
// //   onSearch() {
// //     String query = _controller.text.trim();
// //     if (query.isNotEmpty) {
// //       fetchWeatherData(query);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     if (currentWeather == null || forecast == null) {
// //       return Scaffold(
// //         appBar: AppBar(title: Text('Weather App')),
// //         body: Center(child: CircularProgressIndicator()),
// //       );
// //     } else {
// //       return Scaffold(
// //         appBar: AppBar(
// //           title: Text('Weather Info for $location'),
// //           actions: [
// //             IconButton(
// //               icon: Icon(Icons.search),
// //               onPressed: onSearch,
// //             )
// //           ],
// //         ),
// //         body: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             children: [
// //               // Search Bar
// //               TextField(
// //                 controller: _controller,
// //                 decoration: InputDecoration(
// //                   labelText: 'Search for a location',
// //                   hintText: 'Enter city name',
// //                   border: OutlineInputBorder(),
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               // Current Weather Info
// //               ListTile(
// //                 title: Text('Current Weather in ${currentWeather['location']['name']}'),
// //                 subtitle: Text('Temperature: ${currentWeather['current']['temp_c']}°C'),
// //                 leading: Image.network('https:${currentWeather['current']['condition']['icon']}'),
// //               ),
// //               ListTile(
// //                 title: Text('Condition: ${currentWeather['current']['condition']['text']}'),
// //               ),
// //               ListTile(
// //                 title: Text('Wind: ${currentWeather['current']['wind_kph']} km/h'),
// //               ),
// //               ListTile(
// //                 title: Text('Humidity: ${currentWeather['current']['humidity']}%'),
// //               ),
// //               ListTile(
// //                 title: Text('Feels Like: ${currentWeather['current']['feelslike_c']}°C'),
// //               ),
// //               // 7-Day Forecast
// //               SizedBox(height: 20),
// //               Text('7-Day Forecast:', style: TextStyle(fontSize: 18)),
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: forecast['forecast']['forecastday'].length,
// //                   itemBuilder: (context, index) {
// //                     var day = forecast['forecast']['forecastday'][index];
// //                     return ListTile(
// //                       title: Text('Date: ${day['date']}'),
// //                       subtitle: Text(
// //                           'Max Temp: ${day['day']['maxtemp_c']}°C, Min Temp: ${day['day']['mintemp_c']}°C, Condition: ${day['day']['condition']['text']}'),
// //                       leading: Image.network('https:${day['day']['condition']['icon']}'),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       );
// //     }
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:geolocator/geolocator.dart';

// class WeatherPage extends StatefulWidget {
//   @override
//   _WeatherPageState createState() => _WeatherPageState();
// }

// class _WeatherPageState extends State<WeatherPage> {
//   String apiKey = '5a91b27918904759a6d75924242712'; // Replace with your actual API key
//   TextEditingController _searchController = TextEditingController();
//   String location = 'Unknown'; // Displayed location
//   var weatherData; // Weather data to display
//   bool isLoading = true; // For showing loading state

//   @override
//   void initState() {
//     super.initState();
//     _fetchCurrentLocationWeather();
//   }

//   // Fetch weather for current location
//   Future<void> _fetchCurrentLocationWeather() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       String latLng = '${position.latitude},${position.longitude}';
//       await _fetchWeatherData(latLng);
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//         location = 'Error: Unable to fetch location';
//       });
//     }
//   }

//   // Fetch weather data from API
//   Future<void> _fetchWeatherData(String query) async {
//     setState(() {
//       isLoading = true; // Show loading indicator
//     });
//     try {
//       final response = await http.get(Uri.parse(
//           'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$query&days=3'));
//       if (response.statusCode == 200) {
//         setState(() {
//           weatherData = json.decode(response.body);
//           location = weatherData['location']['name'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         _showError('Error: Unable to fetch weather data');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       _showError('Error: Check your internet connection');
//     }
//   }

//   // Show an error message
//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   // Handle search input
//   void _onSearch() {
//     String query = _searchController.text.trim();
//     if (query.isNotEmpty) {
//       _fetchWeatherData(query);
//     } else {
//       _showError('Please enter a valid location');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Current Weather'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   // Search Bar
//                   TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       labelText: 'Search for a city',
//                       hintText: 'Enter city name',
//                       border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: _onSearch,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Weather Info Display
//                   if (weatherData != null) ...[
//                     Text(
//                       'Weather in $location',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     // Current Weather
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.network(
//                           'https:${weatherData['current']['condition']['icon']}',
//                           height: 50,
//                           width: 50,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           '${weatherData['current']['temp_c']}°C',
//                           style: TextStyle(fontSize: 40),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       weatherData['current']['condition']['text'],
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(height: 20),
//                     // Current Weather Details
//                     _infoTile('Feels Like', '${weatherData['current']['feelslike_c']}°C'),
//                     _infoTile('Humidity', '${weatherData['current']['humidity']}%'),
//                     _infoTile('Wind Speed', '${weatherData['current']['wind_kph']} km/h'),
//                     _infoTile('Pressure', '${weatherData['current']['pressure_mb']} mb'),
//                     _infoTile('UV Index', '${weatherData['current']['uv']}'),
//                     _infoTile('Visibility', '${weatherData['current']['vis_km']} km'),
//                     SizedBox(height: 20),
//                     // Forecast for Next Few Days
//                     Text(
//                       '3-Day Forecast',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     ...weatherData['forecast']['forecastday'].map<Widget>((day) {
//                       return _forecastTile(day);
//                     }).toList(),
//                   ],
//                 ],
//               ),
//             ),
//     );
//   }

//   // Helper widget to display info as a list tile
//   Widget _infoTile(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//           Text(
//             value,
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper widget for forecast display
//   Widget _forecastTile(dynamic forecast) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       child: ListTile(
//         leading: Image.network(
//           'https:${forecast['day']['condition']['icon']}',
//           height: 50,
//           width: 50,
//         ),
//         title: Text(
//           '${forecast['date']} - ${forecast['day']['condition']['text']}',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(
//           'Max: ${forecast['day']['maxtemp_c']}°C, Min: ${forecast['day']['mintemp_c']}°C\n'
//           'Humidity: ${forecast['day']['avghumidity']}%, '
//           'Wind: ${forecast['day']['maxwind_kph']} km/h',
//         ),
//       ),
//     );
//   }
// }
