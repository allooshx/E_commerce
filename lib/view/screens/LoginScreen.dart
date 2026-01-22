import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import 'ForgetPassword.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  String Gordita = "Gordita";

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
    } on FirebaseAuthException catch (e) {
      String errorMessage;
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
          errorMessage = "This user has been disabled";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Operation not allowed";
          break;
        case "email-already-in-use":
          errorMessage = "Email already in use";
          break;
        case "network-request-failed":
          errorMessage = "Network request failed";
          break;
        case "weak-password":
          errorMessage = "Weak password";
          break;
        case "requires-recent-login":
          errorMessage = "Requires recent login";
          break;
        case "invalid-credential":
          errorMessage = "Invalid credential";
          break;
        default:
          errorMessage = "Email Or Password is incorrect";
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
    } catch (e) {
      // أي خطأ آخر غير Firebase
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Error"),
          content: Text(
            e.toString(),
            style: const TextStyle(
              fontFamily: "Gordita",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AuthController>(
      builder: (context, model, a) {
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
                        padding: const EdgeInsets.only(top: 80),
                        child: Align(
                          alignment: Alignment.topLeft,

                          child: Text(
                            "Welcome Back ,\nLogin to your account",
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
                          children: [
                            SizedBox(
                              height: 75,
                              width: double.infinity,
                              child: TextFormField(
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                onEditingComplete: () => FocusScope.of(
                                  context,
                                ).requestFocus(_passwordFocusNode),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                textAlign: TextAlign.left,
                                onChanged: model.updateEmail,

                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return "Enter your email";
                                  }
                                  if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  ).hasMatch(value)) {
                                    return "Enter valid email";
                                  }

                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,

                                decoration: InputDecoration(
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
                                        borderRadius: BorderRadius.circular(10),
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
                                    borderSide: BorderSide.none,
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
                            SizedBox(height: 5),
                            SizedBox(
                              height: 75,
                              width: double.infinity,
                              child: TextFormField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                obscureText: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textAlign: TextAlign.left,
                                onChanged: model.updatePassword,
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return "Enter your password";
                                  }
                                  if (value.length < 8) {
                                    return "Password must be at least 8 characters";
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
                                        borderRadius: BorderRadius.circular(10),
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
                                    borderSide: BorderSide.none,
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
                          ],
                        ),
                      ),

                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Forgetpassword(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                fontFamily: Gordita,
                                fontSize: 12,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 50),
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
                            if (_formKey.currentState!.validate()) {
                              _submit(model);
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: Gordita,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 80),

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

                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Bootstrap.facebook,
                              color: Colors.blue,
                              size: 40,
                            ),

                            style: IconButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              overlayColor: Colors.transparent,
                            ),
                          ),
                          SizedBox(width: 40),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Bootstrap.apple,
                              color: Colors.black,
                              size: 40,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              overlayColor: Colors.transparent,
                            ),
                          ),
                          SizedBox(width: 40),

                          IconButton(
                            onPressed: () {},

                            icon: Icon(
                              Bootstrap.google,
                              color: Colors.red,
                              size: 40,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              overlayColor: Colors.transparent,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: 34),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontFamily: Gordita,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signupscreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
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
    );
  }
}
