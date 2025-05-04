import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email App')),
      body: const Center(child: Text('Tap the FAB to compose')),
      floatingActionButton: const PerfectFab(),
    );
  }
}

class PerfectFab extends StatefulWidget {
  const PerfectFab({super.key});

  @override
  State<PerfectFab> createState() => _PerfectFabState();
}

class _PerfectFabState extends State<PerfectFab> {
  final String _heroTag = 'compose-fab-${UniqueKey()}';
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 1000),
      transitionType: ContainerTransitionType.fadeThrough,
      closedColor: Theme.of(context).colorScheme.primary,
      openColor: Theme.of(context).colorScheme.surface,
      closedElevation: 6,
      closedShape: const CircleBorder(),
      closedBuilder: (_, openContainer) {
        return Hero(
          tag: _heroTag,
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              openContainer();
              setState(() => _isExpanded = true);
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child:
                  _isExpanded
                      ? const Icon(Icons.send, key: ValueKey('send'))
                      : const Icon(Icons.email, key: ValueKey('email')),
            ),
          ),
        );
      },
      openBuilder: (_, __) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() => _isExpanded = false);
        });
        return _ComposeScreen(heroTag: _heroTag);
      },
    );
  }
}

class _ComposeScreen extends StatelessWidget {
  final String heroTag;

  const _ComposeScreen({required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: heroTag,
          child: const Material(
            color: Colors.transparent,
            child: Text('New Email'),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'To',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Compose your email...',
                  border: InputBorder.none,
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
