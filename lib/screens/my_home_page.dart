import 'package:flutter/material.dart';
import 'package:flutter_testing_tutorial/util/time_helper.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/images/${TimeHelper.getTimeOfTheDay()}.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 64),
            FittedBox(
              child: Text(
                "Good ${TimeHelper.getTimeOfTheDay()}",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
