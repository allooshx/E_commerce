import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../../services/auth.dart';
import 'LoginScreen.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

Future<void> _logout(AuthController model, context) async {
  try {
    await model.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
  } catch (e) {
    print("Err");
  }
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<AuthController>(
      create: (_) => AuthController(auth: auth),
      child: Consumer<AuthController>(
        builder: (_, model, __) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80),
                      Text(
                        "My Profile",
                        style: TextStyle(
                          fontFamily: "Gordita",
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 18),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("images/me.png"),
                          ),
                          const SizedBox(width: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "S",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  auth.currentUser!.email!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
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
                          _logout(model, context);
                        },
                        child: Text(
                          "LogOut",
                          style: TextStyle(
                            fontFamily: "Gordita",
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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
