import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              Colors.blueAccent,
              context),
          _customCard("Nearby Places", "Discover cafes, gyms, parks, and more!",
              theme, Colors.greenAccent, context),
          _customCard("Game Notifications", "Invite friends a!", theme,
              Colors.orangeAccent, context),
          _customCard(
              "Food Collection",
              "Contribute to food drives in your area.",
              theme,
              Colors.purpleAccent,
              context),
          _customCard(
              "News & Updates",
              "Stay updated with the latest community news.",
              theme,
              Colors.redAccent,
              context),
        ],
      ),
    );
  }

  Widget _customCard(String title, String description, ThemeData theme,
      Color color, BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 16), // Spacing between cards
      height: MediaQuery.of(context).size.height * 0.85, // 85% of screen height
      decoration: BoxDecoration(
        color: color,
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
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
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
    );
  }
}
