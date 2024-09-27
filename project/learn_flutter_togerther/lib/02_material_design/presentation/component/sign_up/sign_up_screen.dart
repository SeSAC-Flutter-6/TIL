import 'package:flutter/material.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/component/big_button.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/component/sns_login_items.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/component/input_text.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/ui/color_styles.dart';
import 'package:learn_flutter_togerther/02_material_design/presentation/ui/text_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              'Hello,',
              style: TextStyles.headerTextBold,
            ),
            Text('Welcome Back!', style: TextStyles.headerTextRegular),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: InputTextField(
                inputTitle: 'Email',
                hintText: 'Enter Email',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                child: InputTextField(
              inputTitle: 'Enter Password',
              hintText: 'Enter password',
            )),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Forgot Password?',
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.secondary100,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BigButton(title: 'Sign In', onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 3.0,
                  color: Colors.grey[300],
                ),
                const Text(
                  ' Or Sign in With ',
                  style: TextStyle(
                    color: ColorStyles.gray4,
                  ),
                ),
                Container(
                  height: 3.0,
                  color: Colors.grey[300],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SnsLoginItems(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '''Don't have an account?''',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.primary100,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign up',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.primary100,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
