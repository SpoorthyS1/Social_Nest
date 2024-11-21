// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// class ServicesabcTile extends StatelessWidget{
//    final String servername;
//    final String serveraddress;



//    @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                  color:Colors.white,
//                borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(  
//                   child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.symmetric(horizontal: 10,vertical: 10),
//                         ),
//                 ),
//                 children: [
//                   Column(
//                      Container(
//                     child: Text('Address:xyz plane,come here'),
//                   Container(
//                     child: Text('Address:xyz plane,come here'),
//                   ),}
//                 ],
//               ),
//             ),
//           )
//     );
//   }
// }
import 'package:flutter/material.dart';

class ServicesabcTile extends StatelessWidget {
  final String servername;
  final String serveraddress;

  const ServicesabcTile({
    super.key,
    required this.servername,
    required this.serveraddress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color:Color(0xFFF3E8FF),
          border: Border.all(color: Colors.teal.shade200, width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.2),
            //   spreadRadius: 2,
            //   blurRadius: 4,
            //   offset: Offset(0, 2),
            // ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal.shade200, width: 2), // Teal border
        borderRadius: BorderRadius.circular(8), // Matches the ClipRRect radius
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          'lib/images/electrician.jpg',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    ),
              
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      'Electrician: $servername',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.teal[700]),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.location_on, color: Colors.blue, size: 32),
                    Text(
                      'Address: $serveraddress',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blue, size: 32),
                      SizedBox(width: 40),
                   
                    Icon(Icons.video_call, color: Colors.blue, size: 32),
                    ],
                     ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
