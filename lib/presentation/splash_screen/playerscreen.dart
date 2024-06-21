// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:spot_x/core/constants/textconstant.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Album Name',
            style: DefaultStyles.Title1,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.white),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0, // Removing AppBar shadow
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Bangarang.jpg"),
                      fit: BoxFit.cover, // Changed to cover for better fit
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Added spacing between image and text
            // Song name & artist name
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Bangarang", style: DefaultStyles.MusicName),
                Text("Skrillex", style: DefaultStyles.Artistplay),
              ],
            ),
            // Music wave visualization
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(20, (index) {
                  double height = Random().nextDouble() * 50 +
                      10; // Random height between 10 and 60
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      width: 2,
                      height: height,
                      color: Colors.white,
                    ),
                  );
                }),
              ),
            ),
            // Timestamp
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1:01",
                    style: DefaultStyles.Timeconst,
                  ),
                  Text(
                    "3:24",
                    style: DefaultStyles.Timeconst,
                  )
                ],
              ),
            ),
            // Action bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.shuffle, color: Colors.white),
                  Icon(Icons.skip_previous, color: Colors.white),
                  Icon(Icons.play_arrow, color: Colors.white, size: 48),
                  Icon(Icons.skip_next, color: Colors.white),
                  Icon(Icons.repeat, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
