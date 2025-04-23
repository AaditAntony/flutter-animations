import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text("Tap the button below!")),
        floatingActionButton: const AnimatedFab(), // Using our stateful widget
      ),
    );
  }
}

class AnimatedFab extends StatefulWidget {
  const AnimatedFab({super.key});

  @override
  State<AnimatedFab> createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab> {
  bool _isOpen = false; // Tracks if container is open

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(seconds: 1),
      transitionType: ContainerTransitionType.fadeThrough,
      openColor: Colors.white,
      closedColor: Colors.white,
      middleColor: Colors.purpleAccent,
      closedBuilder:
          (_, openContainer) => FloatingActionButton(
            backgroundColor: Colors.purple,

            onPressed: () {
              openContainer(); // Open the container
              setState(() => _isOpen = true); // Update state
            },
            child: Icon(
              _isOpen ? Icons.send : Icons.email,
              color: Colors.white,
            ),
          ),
      openBuilder: (_, __) {
        // Reset state when closed
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() => _isOpen = false);
        });
        return const ComposeScreen();
      },
    );
  }
}

class ComposeScreen extends StatelessWidget {
  const ComposeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Compose Email")),
      body: const Center(child: Text("This is your email screen!")),
    );
  }
}
