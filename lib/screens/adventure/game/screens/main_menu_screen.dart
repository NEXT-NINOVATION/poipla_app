// import 'package:flutter/material.dart';

// import 'settings_menu.dart';
// import 'select_fish.dart';

// // Represents the main menu screen of Spacescape, allowing
// // players to start the game or modify in-game settings.
// class MainMenu extends StatelessWidget {
//   const MainMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFB6E9EB), Color(0xFF207CAF)],
//             begin: FractionalOffset.topLeft,
//             end: FractionalOffset.bottomRight,
//             stops: [
//               0.0,
//               1.0,
//             ],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Game title.
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 50.0),
//                 child: Text(
//                   'いっしょにぼうけん',
//                   style: TextStyle(
//                     fontSize: 40.0,
//                     color: Colors.black,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 20.0,
//                         color: Colors.white,
//                         offset: Offset(0, 0),
//                       )
//                     ],
//                   ),
//                 ),
//               ),

//               // Play button.
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 3,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Push and replace current screen (i.e MainMenu) with
//                     // SelectFish(), so that player can select a fish.
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (context) => const SelectFish(),
//                       ),
//                     );
//                   },
//                   child: const Text('ぼうけんする'),
//                 ),
//               ),

//               // Settings button.
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 3,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const SettingsMenu(),
//                       ),
//                     );
//                   },
//                   child: const Text('せってい'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
