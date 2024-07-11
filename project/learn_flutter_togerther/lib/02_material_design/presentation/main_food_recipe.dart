import 'package:flutter/material.dart';

import 'component/sign_up/sign_up_screen.dart';

class MainFoodRecipe extends StatelessWidget {
  const MainFoodRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SignUpScreen(),
      ),
    );
  }
}
