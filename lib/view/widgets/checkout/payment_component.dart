import 'package:flutter/material.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(
              "https://www.freepnglogos.com/uploads/mastercard-png/mastercard-new-logo-vector-eps-svg-download-3.png",
              fit: BoxFit.cover,
              height: 40,
            ),
          ),
        ),
        SizedBox(width: 16),
        Text(
          "**** **** **** 2033",
          style: TextStyle(
            fontFamily: "Gordita",
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
