import 'package:flutter/material.dart';

class LandmarkCard extends StatelessWidget {
  const LandmarkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network('https://picsum.photos/250?image=9'),
          Text(''),
          Row(
            children: [

            ],
          ),
        ],
      ),
    );
  }
}
