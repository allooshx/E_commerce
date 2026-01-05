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

  Future<void> _signup(AuthController model,context) async {
    try {
      await model.signup();
     Navigator.of(context).pop();
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Error"),
          content: Text(
            e.toString(),
            style: TextStyle(
              fontFamily: Gordita,
              color: Colors.black,
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("ok"),
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
                                height: 60,
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _nameController,
                                  obscureText: false,
                                  textAlign: TextAlign.left,
                                  clipBehavior: Clip.antiAlias,
                                  validator: (value) =>
                                      value!.isEmpty ? "enter your name" : null,
                                  decoration: InputDecoration(
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
                                          FontAwesome.user,
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

                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),

                                  enabled: true,
                                ),
                              ),

                              SizedBox(height: 10),
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _emailController,
                                  obscureText: false,
                                  textAlign: TextAlign.left,
                                  onChanged: model.updateEmail,

                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return "enter your email";
                                    }
                                    if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                    ).hasMatch(value)) {
                                      return "enter valid email";
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
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

                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),

                                  enabled: true,
                                ),
                              ),
                              SizedBox(height: 10),

                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  textAlign: TextAlign.left,
                                  onChanged: model.updatePassword,
                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return "enter your password";
                                    }
                                    if (value.length < 8) {
                                      return "password must be at least 8 characters";
                                    }
                                  },
                                  decoration: InputDecoration(
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
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
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
                                _signup(model,context);
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
                              "Already have an account?",
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
