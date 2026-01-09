import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/ProductDetails.dart';
import 'Product.dart';

class ListItemsHome extends StatelessWidget {
  final Product product;
  String Gordita = "Gordita";

  ListItemsHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ProductDetails(product: product)),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("${product.image}", fit: BoxFit.cover),
                  ),
                ),
                if (product.discountValue != 0)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      height: 24,
                      width: 46,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "-${product.discountValue}%",
                        style: TextStyle(
                          fontFamily: Gordita,
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: -8,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        print("Favorite clicked");
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.redAccent,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),

            EasyStarsRating(
              initialRating: 3,
              starSize: 20,
              animationConfig: StarAnimationConfig.pulse,
              filledColor: Colors.yellow,
              onRatingChanged: (value) {},
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: TextStyle(
                      fontFamily: Gordita,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),

                  Text(
                    product.title,
                    style: TextStyle(
                      fontFamily: Gordita,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),

                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${product.price}\$',
                          style: product.discountValue != 0
                              ? TextStyle(
                                  fontFamily: Gordita,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black,
                                  decoration: TextDecoration.lineThrough,
                                )
                              : TextStyle(
                                  fontFamily: Gordita,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                        ),
                        if (product.discountValue != 0)
                          TextSpan(
                            text:
                                '  ${(product.price * (1 - product.discountValue / 100)).toStringAsFixed(2)}\$',
                            style: TextStyle(
                              fontFamily: Gordita,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.redAccent,
                            ),
                          ),
                      ],
                    ),
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
