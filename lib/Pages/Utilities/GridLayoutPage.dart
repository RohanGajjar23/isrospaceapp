import 'package:flutter/material.dart';
class GridLayoutPage extends StatelessWidget {
  final String title;
  final String value;
  GridLayoutPage({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: (size.width / 1.125) , // Adjust based on spacing
      height: size.height / 10, // Adjust based on spacing
      child: Card(
        color: Colors.white.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}