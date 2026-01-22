import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Methods"),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },

          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Payment Cards",
                style: TextStyle(
                  fontFamily: "Gordita",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
