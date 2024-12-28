import 'package:flutter/material.dart';
import 'package:social_nest/pages/postFood.dart';
import 'package:social_nest/pages/viewFood.dart';


class FoodOptionsPage extends StatelessWidget {
  final String userId;

  FoodOptionsPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Distribution Options"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("I Have Excess Food"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostFoodPage(userId: userId),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                //primary: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.search),
              label: Text("I Need Food"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewFoodPage(userId: userId),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                //primary: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
