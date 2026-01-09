import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Carditemscart extends StatelessWidget {
  final AddToCartModel cartItem;

  const Carditemscart({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                cartItem.image,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          cartItem.title,
                          style: TextStyle(
                            fontFamily: "Gordita",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        child: Icon(Icons.more_vert),
                        onTap: () => print("More"),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),

                  Row(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Color: ",
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            cartItem.color,
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          const Text(
                            "Size: ",
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            cartItem.size,
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 20,
                        children: [
                          InkWell(
                            onTap: () => cartItem.quantity--,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(EvaIcons.minus, size: 30),
                            ),
                          ),
                          Text(
                            " ${cartItem.quantity}",
                            style: const TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 16,
                            ),
                          ),
                          InkWell(
                            onTap: () => cartItem.quantity++,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Bootstrap.plus, size: 30),
                            ),
                          ),
                        ],
                      ),

                      Text(
                        "\$${cartItem.price*cartItem.quantity}",
                        style: const TextStyle(
                          fontFamily: "Gordita",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
