import 'package:flutter/material.dart';

import '../model/ingredient.dart';
import 'component/Ingredient_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});


  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  final ingredient = const Ingredient(
    name: 'Apple',
    imageUrl:
        'https://media.istockphoto.com/id/184276818/ko/%EC%82%AC%EC%A7%84/%EB%A0%88%EB%93%9C-%EC%82%AC%EA%B3%BC%EB%82%98%EB%AC%B4.jpg?s=2048x2048&w=is&k=20&c=ha7OqiGpi8QruIPKcU6rix1-KN_fm210KTHjTFRb4Xk=',
    weight: '500g',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('여기는 mainScreen'),
          IngredientItem(
              ingredient: ingredient,
          ),
        ],
      ),
    );
  }
}
