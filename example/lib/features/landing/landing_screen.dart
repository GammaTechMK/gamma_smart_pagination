import 'package:flutter/material.dart';
import 'package:smart_pagination_example/features/infinite_images/view/infinite_images_view.dart';
import 'package:smart_pagination_example/features/infinite_images_old/view/infinite_images_old_view.dart';
import 'package:smart_pagination_example/features/second/view/second_screen.dart';
import 'package:smart_pagination_example/features/third/view/third_screen.dart';

import '../first/view/first_screen.dart';
import '../gridview/view/gridview_example.dart';

class ExampleLandingScreen extends StatelessWidget {
  const ExampleLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examples'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: const Text('Infinite scroll [shrinkwrap]'),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('No data example'),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ThirdScreen(),
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('GridView example [shrinkwrap]'),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const GridViewExample(),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FirstScreen(),
                  ),
                ),
                child: const Text('Performant Infinite scroll'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InfiniteImagesView(),
                  ),
                ),
                child: const Text('Performant Infinite IMAGES list'),
              ),
              ElevatedButton(
                child: const Text('Infinite Images list [shrinkWrap]'),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InfiniteImagesOldView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
