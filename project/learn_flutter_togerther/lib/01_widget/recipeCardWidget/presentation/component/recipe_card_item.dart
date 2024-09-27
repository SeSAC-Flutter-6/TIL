import 'package:flutter/material.dart';

class RecipeCardItem extends StatelessWidget {
  const RecipeCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(15),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                top: 10,
                right: 100,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
