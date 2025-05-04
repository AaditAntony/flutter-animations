// import 'package:animations/animations.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Email App")),
//       body: const Center(
//         child: Text('press to see the fab animation with hero'),
//       ),
//       floatingActionButton: AnimatedFabWithHero(),
//     );
//   }
// }

// class AnimatedFabWithHero extends StatefulWidget {
//   const AnimatedFabWithHero({super.key});

//   @override
//   State<AnimatedFabWithHero> createState() => _AnimatedFabWithHeroState();
// }

// class _AnimatedFabWithHeroState extends State<AnimatedFabWithHero> {
//   bool _isOpen = false;

//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer(
//       transitionDuration: const Duration(milliseconds: 800),
//       closedColor: Colors.white,
//       openColor: Colors.white,
//       middleColor: Colors.blueAccent,
//       closedBuilder: (_, openContainer) {
//         return Tooltip(
//           message: 'Compose Email',
//           child: Hero(
//             tag: 'fab-hero', // Unique tag
//             flightShuttleBuilder: (_, animation, __, ___, ____) {
//               return ScaleTransition(
//                 scale: animation.drive(
//                   Tween(
//                     begin: 0.8,
//                     end: 1.0,
//                   ).chain(CurveTween(curve: Curves.easeOut)),
//                   //   child: const Icon(Icons.email, color: Colors.white),
//                 ),
//               );
//             },
//             child: FloatingActionButton(
//               backgroundColor: Colors.purple,
//               heroTag: null,
//               onPressed: () {
//                 openContainer();
//                 setState(() => _isOpen = true);
//               },
//               child: AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 200),
//                 child:
//                     _isOpen ? const Icon(Icons.send) : const Icon(Icons.email),
//               ),
//             ),
//           ),
//         );
//       },
//       openBuilder: (_, __) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (mounted) setState(() => _isOpen = false);
//         });
//         return const ComposeScreen();
//       },
//     );
//   }
// }

// class ComposeScreen extends StatelessWidget {
//   const ComposeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Hero(
//           tag: 'fab-hero',
//           child: Material(color: Colors.transparent, child: Text('New Email')),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(decoration: InputDecoration(hintText: 'To')),
//             TextField(decoration: InputDecoration(hintText: 'Subject')),
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(hintText: 'Message'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
