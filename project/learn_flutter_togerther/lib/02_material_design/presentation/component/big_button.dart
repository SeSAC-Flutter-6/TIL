import 'package:flutter/material.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/component/ui/color_styles.dart';

class BigButton extends StatefulWidget {
  final void Function() onTap;

  final String title;

  const BigButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  final bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        child: Text('Sign In'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _isPressed ? ColorStyles.gray4 : ColorStyles.primary100,
        ),
      ),
    );
  }
}
