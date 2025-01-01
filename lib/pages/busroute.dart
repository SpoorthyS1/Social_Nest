import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BMTCTransitPage extends StatefulWidget {
  @override
  _BMTCTransitPageState createState() => _BMTCTransitPageState();
}

class _BMTCTransitPageState extends State<BMTCTransitPage> {
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  List<dynamic> transitRoutes = [];
  bool isLoading = false;

  Future<void> fetchTransitRoutes() async {
    final origin = originController.text;
    final destination = destinationController.text;
    final apiKey = "AIzaSyC4Zeh-wmUI0HQEBu45aKkpCxxLG383Rw0"; // Replace with your Google API Key

    setState(() {
      isLoading = true;
    });

    try {
      final url =
          "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&mode=transit&key=$apiKey";
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      if (data["status"] == "OK") {
        setState(() {
          transitRoutes = data["routes"];
        });
      } else {
        setState(() {
          transitRoutes = [];
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No transit routes found.")),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch transit routes.")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMTC Transit Finder")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: originController,
              decoration: InputDecoration(
                labelText: "Enter Origin",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(
                labelText: "Enter Destination",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchTransitRoutes,
              child: Text("Search Transit Routes"),
            ),
            SizedBox(height: 20),
            if (isLoading) CircularProgressIndicator(),
            if (!isLoading && transitRoutes.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: transitRoutes.length,
                  itemBuilder: (context, index) {
                    final route = transitRoutes[index];
                    final legs = route["legs"];
                    return Card(
                      child: ListTile(
                        title: Text("Route ${index + 1}"),
                        subtitle: Text(
                          legs.map((leg) => leg["start_address"]).join(" -> "),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
