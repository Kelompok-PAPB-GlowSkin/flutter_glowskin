import 'dart:io';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  final bool isEdits;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdits = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            right: 4,
            bottom: 0,
            child: buildEditIcon(color)
          ),
        ]
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 200,
          height: 200,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.black,
    all: 3,
    child: buildCircle(
      color : Color(0xFFD9D9D9),
      all : 8,
      child: Icon(
        isEdits ? Icons.add_a_photo : Icons.edit,
        color: Colors.black,
        size: 30,
      ),
    ),
  );

  Widget buildCircle({
    required Color color,
    required double all,
    required Widget child,
  }) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
}