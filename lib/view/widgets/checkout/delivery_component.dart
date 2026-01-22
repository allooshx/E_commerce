import 'package:ecommerce/models/DeliveryMethod.dart';
import 'package:flutter/material.dart';

class DeliveryComponent extends StatelessWidget {
  final DeliveryMethod deliveryMethod;

  DeliveryComponent({super.key, required this.deliveryMethod});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 100,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 24),
          ],

          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                deliveryMethod.imageUrl,
                fit: BoxFit.cover,
                width: 50,
                height: 25,
              ),
              SizedBox(height: 12),
              Text(
                "days ${deliveryMethod.days}",
                style: TextStyle(
                  fontFamily: "Gordita",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
