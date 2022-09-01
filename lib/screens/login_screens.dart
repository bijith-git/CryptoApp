import 'package:cryptoapp/components/form_section.dart';
import 'package:cryptoapp/config/constants.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    isSelected = true;
  }

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: height * 0.060,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: kDarkBlack, borderRadius: BorderRadius.circular(12)),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSelected = true;
                            });
                          },
                          child: Container(
                            width: constraints.maxWidth / 2,
                            decoration: isSelected
                                ? BoxDecoration(
                                    color: kBlack,
                                    borderRadius: BorderRadius.circular(10))
                                : null,
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: isSelected ? kWhite : kGrey,
                                  fontFamily: 'Myriadpro',
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSelected = false;
                            });
                          },
                          child: Container(
                            width: constraints.maxWidth / 2,
                            decoration: isSelected
                                ? null
                                : BoxDecoration(
                                    color: kBlack,
                                    borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: isSelected ? kGrey : kWhite,
                                  fontFamily: 'Myriadpro',
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              isSelected
                  ? const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 35, color: kWhite, fontFamily: font),
                    )
                  : const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 35, color: kWhite, fontFamily: font),
                    ),
              FormSection(
                signUp: isSelected,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
