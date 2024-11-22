import 'package:flutter/material.dart';
import 'serviceabctile.dart';  // Import the ServicesabcTile widget

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Electricans'),
        
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          // Display multiple ServicesabcTile widgets
          ServicesabcTile(

            servername: 'Aman',
            serveraddress: 'Street:  Digvijay Bhavan, 9/697 Gorai Road, Borivali (west),\nCity:   Mumbai\nState/province/area:    Maharashtra\nZip code:  400092',
          ),
          ServicesabcTile(
            servername: 'Aarav Jha',
            serveraddress: 'Street:  52/53, Awing, 5th Floor, Mittal Crt, Nariman Point\nCity:   Mumbai\nState/province/area:    Maharashtra\nZip code:  400021',
          ),
          ServicesabcTile(
            servername: 'Suman',
            serveraddress: 'Street:  19 Amarnath Estate, Nr Idgah Chowky, Nr Idgah Chowky Old Manke Chowk Mill, Grant Road\nCity:   Mumbai\nState/province/area:    Maharashtra\nZip code:  380016',
          ),
          ServicesabcTile(
            servername: 'Kuber',
            serveraddress: 'Street:  128, 1st Floor, Heena Apts, Cd Marg, 1st Road, Opp Khar Library, Nr Madhu Park, Khar (west)\nCity:   Mumbai\nState/province/area:    Maharashtra\nZip code:  400052',
          ),
        ],
      ),
    );
  }
}
