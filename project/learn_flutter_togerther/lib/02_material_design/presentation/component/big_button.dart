import 'package:flutter/material.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/component/ui/color_styles.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/component/ui/text_styles.dart';

class BigButton extends StatefulWidget {
  //data
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
  //ui
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _isPressed ? ColorStyles.gray4 : ColorStyles.primary100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                widget.title,
                //style: TextStyles.mediumTextRegular
              ),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
