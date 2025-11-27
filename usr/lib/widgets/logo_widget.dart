import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final Color? color;

  const LogoWidget({super.key, this.size = 40, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = color ?? theme.colorScheme.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.stairs_rounded, // Represents steps/growth
          size: size * 1.5,
          color: primaryColor,
        ),
        const SizedBox(height: 8),
        Text(
          'Next Step!!',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: primaryColor,
            letterSpacing: 1.2,
            fontSize: size,
          ),
        ),
        Text(
          'Discover Your Future',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
