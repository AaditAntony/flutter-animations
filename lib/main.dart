import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text("tap the button bellow ")),
        floatingActionButton: OpenContainer(
          transitionDuration: const Duration(milliseconds: 800),
          transitionType: ContainerTransitionType.fadeThrough,
          closedColor: Colors.white, // FAB color
          openColor: Colors.white, // Screen background
          closedBuilder:
              (_, openContainer) => FloatingActionButton(
                backgroundColor: Colors.purple,
                onPressed: openContainer,
                child: const Icon(Icons.email, color: Colors.white),
              ),
          openBuilder: (_, __) => const ComposeScreen(),
        ),
      ),
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
