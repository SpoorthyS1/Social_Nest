// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class TallCarouselCards extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       body: CarouselSlider(
//         options: CarouselOptions(
//           height: MediaQuery.of(context).size.height, // Full screen height
//           autoPlay: true,
//           enlargeCenterPage: true,
//           enableInfiniteScroll: false,
//           autoPlayInterval: Duration(seconds: 3),
//         ),
//         items: [
//           _customCard(
//               "Explore the Map",
//               "Interactive map view with Google Maps.",
//               theme,
//               Colors.blueAccent,
//               context),
//           _customCard("Nearby Places", "Discover cafes, gyms, parks, and more!",
//               theme, Colors.greenAccent, context),
//           _customCard("Game Notifications", "Invite friends a!", theme,
//               Colors.orangeAccent, context),
//           _customCard(
//               "Food Collection",
//               "Contribute to food drives in your area.",
//               theme,
//               Colors.purpleAccent,
//               context),
//           _customCard(
//               "News & Updates",
//               "Stay updated with the latest community news.",
//               theme,
//               Colors.redAccent,
//               context),
//         ],
//       ),
//     );
//   }

//   Widget _customCard(String title, String description, ThemeData theme,
//       Color color, BuildContext context) {
//     return Container(
//       margin:
//           const EdgeInsets.symmetric(horizontal: 16), // Spacing between cards
//       height: MediaQuery.of(context).size.height * 0.85, // 85% of screen height
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(16.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 16),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.white70,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:social_nest/pages/foodOptions.dart';
import 'package:social_nest/pages/gamespage.dart';
import'package:social_nest/pages/mappage.dart';
import 'package:social_nest/pages/nearbyplaces.dart';
import 'package:social_nest/pages/newspage.dart';
import 'package:social_nest/pages/weatherpage.dart';
import 'package:social_nest/pages/busroute.dart';

class TallCarouselCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height, // Full screen height
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlayInterval: Duration(seconds: 3),
        ),
        items: [
          _customCard(
               "Explore the Map",
               "Interactive map view with Google Maps.",
                theme,
                [Colors.blueAccent, Colors.lightBlue],
                Icons.map,
                () => _onCardTap1(context,),
                ),

           _customCard(
                "Check Weather",
                "Get the current weather information for your location.",
                 theme,
                [Colors.deepPurple, Colors.purpleAccent],
                Icons.cloud,
                 () => _onWeatherCardTap(context),
                ),
     

          _customCard(
            "Nearby Places",
            "Discover cafes, parks, and more!",
            theme,
            [Colors.greenAccent, Colors.teal],
            Icons.place,
            () => _onnearbyCardTap(context ),
          ),
          _customCard(
            "Game Notifications",
            "Invite friends to play together!",
            theme,
            [Colors.orangeAccent, Colors.deepOrange],
            Icons.notifications_active,
            () => _onCardTap(context, "Game Notifications"),
          ),
          _customCard(
            "Food Collection",
            "Contribute to food drives in your area.",
            theme,
            [Colors.purpleAccent, Colors.deepPurple],
            Icons.food_bank,
            () => _onFoodCardTap(context,),
          ),
          _customCard(
           "Bus Route Finder",
             "Find BMTC bus routes between two locations.",
             Theme.of(context),
            [Colors.lightBlueAccent, Colors.blue],
              Icons.directions_bus,
              () => _onBMTCTransitCardTap(context),
            ),
          _customCard(
          "News & Updates",
          "Stay updated with the latest community news.",
          theme,
          [Colors.redAccent, Colors.pinkAccent],
          Icons.newspaper,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsPage()),
          ),
        ),
//           _customCard(
//   "Play Games",
//   "Access and play various online games.",
//   theme,
//   [Colors.green, Colors.lightGreen],
//   Icons.videogame_asset,
//   () => _onGamesCardTap(context, "Play Games"),
// ),

        ],
      ),
    );
  }

  Widget _customCard(
    String title,
    String description,
    ThemeData theme,
    List<Color> gradientColors,
    IconData icon,
    VoidCallback onTap,
  ) {
    final isDarkTheme = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:
            const EdgeInsets.symmetric(horizontal: 16), // Spacing between cards
        height: 200, // Fixed tall height for the card
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: isDarkTheme ? Colors.black54 : Colors.white70,
                child: Icon(
                  icon,
                  size: 40,
                  color: gradientColors.last,
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCardTap(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You tapped on "$title"!'),
      ),
    );
  }
  void _onCardTap1(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MapPage()),
  );
}
void _onWeatherCardTap(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WeatherPage()),
  );
}
void _onFoodCardTap(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FoodOptionsPage(userId:FirebaseAuth.instance.currentUser!.uid,)),
  );
}
void _onBMTCTransitCardTap(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => BMTCTransitPage()),
  );
}
void _onnearbyCardTap(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>NearbyPlacesPage() )
    );
}
// void _onGamesCardTap(BuildContext context, String title) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => GamesPage(),
//     ),
//   );
// }

}