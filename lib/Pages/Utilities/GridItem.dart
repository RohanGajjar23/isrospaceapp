import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  GridItem({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10.0,
              spreadRadius: 1,
              offset: Offset(1.0, 1.0),
            )
          ],
        ),
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 60.0,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
