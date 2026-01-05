import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shopscreen extends StatefulWidget {
  const Shopscreen({super.key});

  @override
  State<Shopscreen> createState() => _ShopscreenState();
}

class _ShopscreenState extends State<Shopscreen> {
  String Gordita = "Gordita";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(
          "Categories",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: Gordita,
          ),
        ),
        leading: InkWell(
          onTap: () {},
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: Icon(CupertinoIcons.back),
        ),
        actions: [
          InkWell(
            onTap: () {},
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Icon(CupertinoIcons.search),
          ),
        ],

        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
    );
  }
}
