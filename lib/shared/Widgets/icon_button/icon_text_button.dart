import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final double height;
  final double width;
  final double padding;
  final double spacing;
  final AlignmentGeometry alignement;
  final bool iconFirst;
  final VoidCallback onTap;
  final Icon icon;
  final Text text;

  const IconTextButton({
    super.key,
    this.height = double.maxFinite,
    this.width = 25.0,
    this.padding = 5.0,
    this.spacing = 5.0,
    this.alignement = Alignment.center,
    this.iconFirst = true,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignement,
        height: height,
        width: width,
        child: Wrap(
          spacing: spacing,
          children: iconFirst
              ? [
                  icon,
                  text,
                ]
              : [
                  text,
                  icon,
                ],
        ),
      ),
    );
  }
}
