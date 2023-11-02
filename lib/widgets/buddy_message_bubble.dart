import 'package:flutter/material.dart';

class BuddyMessageBubble extends StatelessWidget {
  const BuddyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: size.width * 0.7),
          decoration: BoxDecoration(
            color: colors.inversePrimary,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              'Anim commodo et deserunt sit proident voluptate duis commodo tempor.',
              style: TextStyle(color: Color(0xFF2A2A2A)),
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        _ImageBubble(size: size),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final Size size;

  const _ImageBubble({required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.network(
        'https://yesno.wtf/assets/no/7-331da2464250a1459cd7d41715e1f67d.gif',
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return SizedBox(
            height: 150,
            width: size.width * 0.7,
            child: const Center(child: Text('Loading...')),
          );
        },
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: child,
          );
        },
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
