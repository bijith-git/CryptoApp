import 'package:cryptoapp/components/icon_buttom.dart';
import 'package:cryptoapp/config/constants.dart';
import 'package:flutter/material.dart';

class OtherButtons extends StatelessWidget {
  const OtherButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Or Sign Up With",
          style: TextStyle(color: kLightGrey, fontFamily: font, fontSize: 14),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
                press: () {},
                title: "Google",
                img: 'assets/images/icons/google.png'),
            CustomIconButton(
                press: () {},
                title: "Facebook",
                img: 'assets/images/icons/facebook.png')
          ],
        )
      ],
    );
  }
}
