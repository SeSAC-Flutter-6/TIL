import 'package:flutter/material.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/ui/color_styles.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/ui/text_styles.dart';

class TextfieldItem extends StatefulWidget {
  const TextfieldItem({super.key});

  @override
  State<TextfieldItem> createState() => _TextfieldItemState();
}

class _TextfieldItemState extends State<TextfieldItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyles.smallTextRegular,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Email',
              hintStyle: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray4,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
