// task_card.dart
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;

  TaskCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}