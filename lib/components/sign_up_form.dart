import 'package:cryptoapp/components/othe_sign_button.dart';
import 'package:cryptoapp/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/config/constants.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isVisible = true;
  TextEditingController emailController = TextEditingController();

  TextEditingController psswrdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const SizedBox(
        height: 20,
      ),
      const Text(
        "Name",
        style: formtext,
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: kDarkBlack, borderRadius: BorderRadius.circular(10)),
        child: const TextField(
          style: TextStyle(color: kLightGrey),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
                fontFamily: font, color: kLightGrey, letterSpacing: 1),
            hintText: "Enter Your Name",
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text("Email", style: formtext),
      const SizedBox(
        height: 10,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: kDarkBlack, borderRadius: BorderRadius.circular(10)),
        child: TextField(
          style: const TextStyle(color: kLightGrey),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
                fontFamily: font, color: kLightGrey, letterSpacing: 1),
            hintText: "Enter Your Email",
          ),
          controller: emailController,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text("Password", style: formtext),
      const SizedBox(
        height: 10,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: kDarkBlack, borderRadius: BorderRadius.circular(10)),
        child: TextField(
          style: const TextStyle(color: kLightGrey),
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: _isVisible
                  ? const Icon(
                      Icons.visibility_off,
                      color: kLightGrey,
                    )
                  : const Icon(
                      Icons.remove_red_eye,
                      color: kLightGrey,
                    ),
            ),
            border: InputBorder.none,
            hintStyle: const TextStyle(
                fontFamily: font, color: kLightGrey, letterSpacing: 1),
            hintText: "Enter Your Password",
          ),
          obscureText: _isVisible,
          controller: psswrdController,
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      ElevatedButton(
          onPressed: () async {
            await auth.createAccount(
                emailController.text, psswrdController.text);
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: kGreen,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 20)),
          child: const Text(
            "Sign Up",
            style: TextStyle(color: kBlack, fontWeight: FontWeight.bold),
          )),
      const SizedBox(
        height: 30,
      ),
      const OtherButtons()
    ]);
  }
}
