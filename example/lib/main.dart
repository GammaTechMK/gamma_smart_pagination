import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pagination_example/features/landing/landing_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
          title: 'GammaSmartPagination demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
            ),
            useMaterial3: true,
          ),
          home: const ExampleLandingScreen()),
    ),
  );
}
