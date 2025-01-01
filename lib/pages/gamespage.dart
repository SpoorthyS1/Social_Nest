// import 'package:flutter/material.dart';
// import 'package:social_nest/pages/onlinegame.dart';


// class GamesPage extends StatelessWidget {
//   final List<Map<String, String>> games = [
//     {"name": "Tic Tac Toe", "url": "https://playtictactoe.org/"},
//     {"name": "Chess", "url": "https://www.chess.com/play/online"},
//     {"name": "Snake Game", "url": "https://playsnake.org/"},
//     {"name": "Pac-Man", "url": "https://www.retrogames.cc/embed/41745-pac-man.html"},
//     {"name": "Minesweeper", "url": "https://minesweeperonline.com/"},
//     {"name": "Sudoku", "url": "https://sudoku.com/"},
//   ];
// // 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Play Games"),
//       ),
//       body: ListView.builder(
//         itemCount: games.length,
//         itemBuilder: (context, index) {
//           final game = games[index];
//           return ListTile(
//             leading: Icon(Icons.videogame_asset, color: Colors.green),
//             title: Text(game["name"]!),
//             trailing: Icon(Icons.arrow_forward, color: Colors.green),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => OnlineGame(
//                     gameName: game["name"]!,
//                     gameUrl: game["url"]!,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
