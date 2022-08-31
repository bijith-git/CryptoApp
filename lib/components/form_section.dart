// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cryptoapp/components/othe_sign_button.dart';
import 'package:cryptoapp/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import 'package:cryptoapp/config/constants.dart';

class FormSection extends StatefulWidget {
  const FormSection({
    Key? key,
    required this.signUp,
  }) : super(key: key);
  final bool signUp;

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  @override
  void initState() {
    super.initState();
    _signInType;
  }

  bool _signInType = false;
  bool _isVisible = true;
  TextEditingController emailController = TextEditingController();

  TextEditingController psswrdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.signUp
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _signInType
                      ? const Text("Email", style: formtext)
                      : const Text(
                          "Mobile",
                          style: formtext,
                        ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _signInType = !_signInType;
                        });
                      },
                      child: _signInType
                          ? const Text('Register With Mobile',
                              style: TextStyle(
                                color: kGreen,
                                letterSpacing: .5,
                                fontWeight: FontWeight.bold,
                                fontFamily: font,
                                fontSize: 16,
                              ))
                          : const Text('Register With Email',
                              style: TextStyle(
                                color: kGreen,
                                letterSpacing: .5,
                                fontWeight: FontWeight.bold,
                                fontFamily: font,
                                fontSize: 16,
                              )))
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: kDarkBlack, borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: const TextStyle(color: kLightGrey),
                  cursorColor: kLightGrey,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                        fontFamily: font, color: kLightGrey, letterSpacing: 1),
                    hintText: _signInType
                        ? "Enter Your Email"
                        : "Enter Your Mobile Number",
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: kDarkBlack, borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: const TextStyle(color: kLightGrey),
                  obscureText: _isVisible,
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
                  controller: psswrdController,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: kGreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20)),
                  child: const Text(
                    "Sign In",
                    style:
                        TextStyle(color: kBlack, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              const OtherButtons()
            ],
          )
        : const SignUpForm();
  }
}
