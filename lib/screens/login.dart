import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/meetup.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool checkBoxValue = false;
  final formField = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formField,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Promilo",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Hi,Welcome Back!",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 26, right: 26),
                    child: Row(
                      children: [
                        Text(
                          "Please Sign in to continue",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      onChanged: (_) {
                        setState(() {
                          if (_.isNotEmpty) {}
                        });
                      },
                      validator: (_) {
                        if ((_ ?? '').isEmpty) {
                          return 'Mail Id is mandatory';
                        } else if (!RegExp(
                                r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(_ ?? '')) {
                          return 'Please provide correct email';
                        } else {
                          return null;
                        }
                      },
                      controller: phoneTextController,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: "Enter Email or Mob No.",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text(
                          "Sign in With OTP",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 26, right: 26),
                    child: Row(
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      validator: (_) {
                        if ((_ ?? '').isEmpty) {
                          return 'Password is mandatory';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (_) {
                        setState(() {
                          if (_.isNotEmpty) {}
                        });
                      },
                      controller: passwordTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: "Enter Password",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 3.0,
                            ),
                            Checkbox(
                              value: checkBoxValue,
                              shape: const RoundedRectangleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  checkBoxValue = value ?? false;
                                });
                              },
                            ),
                            const Text("Remember me"),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Forget Password",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (passwordTextController.text.isNotEmpty &&
                                  phoneTextController.text.isNotEmpty)
                              ? Colors.blue
                              : Colors.blue[100],
                      textStyle: const TextStyle(color: Colors.white),
                      // padding: EdgeInsets.only(left: 150.0,right: 150.0,top: 20.0,bottom: 20.0),
                      fixedSize: const Size(350, 60),
                      side: const BorderSide(color: Colors.blue, width: 3.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onPressed: () {
                      if (passwordTextController.text.isEmpty ||
                          phoneTextController.text.isEmpty) {
                      } else if (formField.currentState?.validate() == true &&
                          passwordTextController.text == 'Test@123' &&
                          phoneTextController.text == 'test45@yopmail.com') {
                        passwordTextController.clear();
                        phoneTextController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Mymeetup();
                            },
                          ),
                        );

                      } else {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) => const AlertDialog(
                            backgroundColor: Colors.white,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Error!!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Email Id or Password are not correct",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                          child: Text("or"),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "asset/images/google.svg",
                          height: 40,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset(
                          "asset/images/linkdin.svg",
                          height: 40,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset(
                          "asset/images/facebook.svg",
                          height: 40,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset(
                          "asset/images/instagram.svg",
                          height: 40,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset(
                          "asset/images/whatsapp.svg",
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Business User?",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Don't have an account",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Login Here",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "By continuing, you agree to",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 0.1,
                  ),
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                          text: "Promilo's",
                        ),
                        TextSpan(
                            text: '  Terms of Use & Privacy Policy.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            )),
                      ])),
                ],
              ),
            ),
          ),
        ));
  }
}
