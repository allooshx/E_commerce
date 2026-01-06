import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  String Gordita = "Gordita";
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: Color(0xFFF9F9F9),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back, color: Colors.black, size: 30),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 100),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Forgot password",
                        style: TextStyle(
                          fontFamily: Gordita,
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Please, enter your email address. You will receive a link to create a new password via email.",
                    style: TextStyle(
                      fontFamily: Gordita,
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),

                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: TextFormField(
                      controller: _emailController,
                      obscureText: false,
                      textAlign: TextAlign.left,
                      validator: (value) =>
                          value!.isEmpty ? "enter your password" : null,

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
                              color: Color(0xffF67952).withOpacity(0.10),
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
                          borderSide: BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      enabled: true,
                    ),
                  ),

                  SizedBox(height: 30),
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
                      onPressed: () {},
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontFamily: Gordita,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
