import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final String icon;
  final Color backgroundColor;
  final Color iconColor;
  final String? name;

  const IconCard({
    super.key,
    required this.icon,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.iconColor = Colors.green,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              icon,
              width: 40,
              height: 40,
            ),
            SizedBox(height: 10),
            Text( 
              name ?? '',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
