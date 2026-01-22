import 'package:flutter/material.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Alaa Amer",
                  style: TextStyle(
                    fontFamily: "Gordita",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Change",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Gordita",
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              "3 Newbridge Court Chino Hills\n CA 91709, United States",
              style: TextStyle(
                fontFamily: "Gordita",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
