import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../../services/auth.dart';
import '../widgets/BottomNavBar.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  String Gordita = "Gordita";

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _signup(AuthController model, context) async {
    try {
      await model.signup();
      Navigator.of(context).pop();
    } catch (e) {
      // القيمة الافتراضية دائماً
      String errorMessage = "Invalid Email or Password";

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case "invalid-email":
            errorMessage = "Invalid Email";
            break;
          case "user-not-found":
            errorMessage = "User not found";
            break;
          case "wrong-password":
            errorMessage = "Wrong password";
            break;
          case "user-disabled":
            errorMessage = "User has been disabled";
            break;
          case "email-already-in-use":
            errorMessage = "Email already in use";
            break;
          case "weak-password":
            errorMessage = "Weak password";
            break;
        }
      }

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Authentication Error",
            style: TextStyle(
              fontFamily: "Gordita",
              color: Colors.redAccent,
              fontSize: 12,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(
              fontFamily: "Gordita",
              color: Colors.black,
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Gordita",
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<AuthController>(
      create: (_) => AuthController(auth: auth),
      child: Consumer<AuthController>(
        builder: (_, model, a) {
          return Scaffold(
            backgroundColor: Color(0xFFF9F9F9),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 90),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Welcome Partner !\nSign Up to start your\njourney with us",
                              style: TextStyle(
                                fontFamily: Gordita,
                                color: Colors.black,
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 75,
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _nameController,
                                  focusNode: _nameFocusNode,
                                  onEditingComplete: () => FocusScope.of(
                                    context,
                                  ).requestFocus(_emailFocusNode),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  obscureText: false,
                                  textAlign: TextAlign.left,
                                  clipBehavior: Clip.antiAlias,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: model.updateName,
                                  validator: (value) =>
                                      value!.isEmpty ? "Enter your name" : null,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 12,
                                    ),

                                    fillColor: Colors.white,
                                    filled: true,

                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Color(
                                            0xffF67952,
                                          ).withOpacity(0.10),
                                        ),

                                        child: Icon(
                                          CupertinoIcons.person,
                                          size: 24,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                    hintText: "name",
                                    hintStyle: TextStyle(
                                      fontFamily: Gordita,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      color: Colors.grey,
                                    ),

                                    labelStyle: TextStyle(
                                      fontFamily: Gordita,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                                  enabled: true,
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 75,
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _emailController,
                                  obscureText: false,
                                  textAlign: TextAlign.left,
                                  onChanged: model.updateEmail,

                                  focusNode: _emailFocusNode,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onEditingComplete: () => FocusScope.of(
                                    context,
                                  ).requestFocus(_passwordFocusNode),

                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,

                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return "Enter your email";
                                    }
                                    if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                    ).hasMatch(value)) {
                                      return "Enter correct email";
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 12,
                                    ),

                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Color(
                                            0xffF67952,
                                          ).withOpacity(0.10),
                                        ),

                                        child: Icon(
                                          Clarity.email_line,
                                          size: 24,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                    hintText: "email",
                                    hintStyle: TextStyle(
                                      fontFamily: Gordita,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      color: Colors.grey,
                                    ),

                                    labelStyle: TextStyle(
                                      fontFamily: Gordita,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                                  enabled: true,
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 75,
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  textAlign: TextAlign.left,
                                  onChanged: model.updatePassword,
                                  focusNode: _passwordFocusNode,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.visiblePassword,

                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return "Enter your password";
                                    }
                                    if (value.length < 8) {
                                      return "Password must be at least 8 characters";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 12,
                                    ),

                                    fillColor: Colors.white,
                                    filled: true,

                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Color(
                                            0xffF67952,
                                          ).withOpacity(0.10),
                                        ),

                                        child: Icon(
                                          OctIcons.lock,

                                          size: 24,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                    hintText: "password",
                                    hintStyle: TextStyle(
                                      fontFamily: Gordita,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      color: Colors.grey,
                                    ),

                                    labelStyle: TextStyle(
                                      fontFamily: Gordita,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                                  enabled: true,
                                ),
                              ),

                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: MSHCheckbox(
                                      size: 25,
                                      value: isChecked,

                                      colorConfig:
                                          MSHColorConfig.fromCheckedUncheckedDisabled(
                                            uncheckedColor: Colors.grey,
                                            checkedColor: Colors.redAccent,
                                          ),
                                      style: MSHCheckboxStyle.stroke,
                                      onChanged: (selected) {
                                        setState(() {
                                          isChecked = selected;
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "I accept all the terms and conditions",
                                      style: TextStyle(
                                        fontFamily: Gordita,
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide.none,
                              ),
                              backgroundColor: Colors.redAccent,
                              minimumSize: Size(double.infinity, 55),
                              elevation: 1,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  isChecked == true) {
                                _signup(model, context);
                              } else {
                                print(
                                  "You Need to Accept terms and conditions",
                                );
                              }
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontFamily: Gordita,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 30),

                        Row(
                          children: [
                            Spacer(),
                            Container(
                              height: 0.5,
                              width: 120,
                              color: Colors.grey,
                            ),
                            Spacer(),

                            Text(
                              "Or",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: Gordita,
                                letterSpacing: 1,
                              ),
                            ),

                            Spacer(),

                            Container(
                              height: 0.5,
                              width: 120,
                              color: Colors.grey,
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 30),

                        Row(
                          children: [
                            Spacer(),

                            InkWell(
                              onTap: () {},
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Icon(
                                Bootstrap.facebook,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                            SizedBox(width: 40),
                            InkWell(
                              onTap: () {},
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Icon(
                                Bootstrap.apple,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),

                            SizedBox(width: 40),

                            InkWell(
                              onTap: () {},
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Icon(
                                Bootstrap.google,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                fontFamily: Gordita,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontFamily: Gordita,
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
