import 'package:flutter/material.dart';

class SnsLoginItems extends StatelessWidget {
  const SnsLoginItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              'asset/images/googleIconButton.png',
            ),
            width: 50,
            height: 50,
          ),
          Container(
            child: Image.asset(
              'asset/images/faceBookIconButton.png',
            ),
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
