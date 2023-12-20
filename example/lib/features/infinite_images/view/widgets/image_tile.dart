import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
