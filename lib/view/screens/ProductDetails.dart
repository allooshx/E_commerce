import 'package:ecommerce/models/constsOfDart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/database_controller.dart';
import '../../models/add_to_cart_model.dart';
import '../widgets/Product.dart';
import '../widgets/dropDownMenu.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

String Gordita = "Gordita";

class _ProductDetailsState extends State<ProductDetails> {
  bool isfavorite = false;

  late String dropDownValue;

  Future<void> _addToCart() async {
    final database = Provider.of<Database>(context);
    try {
      final add = AddToCartModel(
        id: decumentIDFromLocalData(),
        title: widget.product.title,
        price: widget.product.price,
        image: widget.product.image,
        size: dropDownValue,
        productId: widget.product.id,
      );
      await database.addToCart(add);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: Gordita,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
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
            child: Icon(Icons.share),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.product.image,
              height: size.height * 0.50,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: Dropdownmenu(
                            items: ['S', 'M', 'L', 'XL', 'XXL'],
                            hint: 'Size',
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            isfavorite = !isfavorite;
                          });
                        },
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                isfavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.redAccent,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.title,
                        style: TextStyle(
                          fontFamily: Gordita,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      if (widget.product.discountValue != 0)
                        Text(
                          '  ${(widget.product.price * (1 - widget.product.discountValue / 100)).toStringAsFixed(2)}\$',
                          style: widget.product.discountValue != 0
                              ? TextStyle(
                                  fontFamily: Gordita,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.redAccent,
                                )
                              : TextStyle(
                                  fontFamily: Gordita,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                        ),
                      if (widget.product.discountValue == 0)
                        Text(
                          '${widget.product.price}\$',
                          style: TextStyle(
                            fontFamily: Gordita,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.product.category,
                    style: TextStyle(
                      fontFamily: Gordita,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontFamily: Gordita,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide.none,
                      ),
                      backgroundColor: Colors.redAccent,
                      minimumSize: Size(double.infinity, size.height * 0.07),
                      elevation: 1,
                    ),

                    onPressed: () async {
                      await _addToCart();
                    },
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                        fontFamily: Gordita,
                        fontSize: 14,
                        color: Colors.white,
                      ),
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
