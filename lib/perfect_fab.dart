// import 'package:flutter/material.dart';
// import 'package:animations/animations.dart';

// class PerfectFab extends StatefulWidget {
//   const PerfectFab({super.key});

//   @override
//   State<PerfectFab> createState() => _PerfectFabState();
// }

// class _PerfectFabState extends State<PerfectFab> {
//   final String _heroTag = 'fab-${DateTime.now().millisecondsSinceEpoch}-${UniqueKey().hashCode}';
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer(
//       transitionDuration: const Duration(milliseconds: 450),
//       transitionType: ContainerTransitionType.fadeThrough,
//       closedColor: Theme.of(context).colorScheme.primary,
//       openColor: Theme.of(context).scaffoldBackgroundColor,
//       middleColor: Theme.of(context).colorScheme.primaryContainer,
//       closedElevation: 6,
//       openElevation: 0,
//       closedShape: RoundedRectangleBorder(
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//       closedBuilder: (_, openContainer) {
//         return Hero(
//           tag: _heroTag,
//           flightShuttleBuilder: (context, animation, flightDirection, _, __) {
//             return AnimatedBuilder(
//               animation: animation,
//               builder: (_, child) {
//                 return Transform.scale(
//                   scale: Curves.easeOutBack.transform(animation.value),
//                   child: Opacity(
//                     opacity: animation.value.clamp(0.5, 1.0),
//                     child: child,
//                   ),
//                 );
//               },
//               child: FloatingActionButton(
//                 heroTag: null,
//                 onPressed: () {
//                   openContainer();
//                   setState(() => _isExpanded = true);
//                 },
//                 child: AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 200),
//                   switchInCurve: Curves.easeOutBack,
//                   switchOutCurve: Curves.easeInBack,
//                   child: _isExpanded
//                       ? const Icon(Icons.send, key: ValueKey('send'))
//                       : const Icon(Icons.email, key: ValueKey('email')),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//       openBuilder: (_, __) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (mounted) setState(() => _isExpanded = false);
//         });
//         return _ComposeScreen(heroTag: _heroTag);
//       },
//     );
//   }
// }

// class _ComposeScreen extends StatelessWidget {
//   final String heroTag;

//   const _ComposeScreen({required this.heroTag});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Hero(
//           tag: heroTag,
//           child: Material(
//             color: Colors.transparent,
//             child: Text(
//               'New Email',
//               style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.close),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'To',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 12),
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Compose email...',
//                   border: InputBorder.none,
//                 ),
//                 maxLines: null,
//                 keyboardType: TextInputType.multiline,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
