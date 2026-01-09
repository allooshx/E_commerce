
import 'package:ecommerce/controller/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/add_to_cart_model.dart';
import '../widgets/cardItemsCart.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

String Gordita = "Gordita";

class _BagScreenState extends State<BagScreen> {
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return SafeArea(
      child: StreamBuilder<List<AddToCartModel>>(
        stream: database.myProductsCartStream(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.active) {
            final cartItems = asyncSnapshot.data;
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Bag",
                        style: TextStyle(
                          fontFamily: "Gordita",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (cartItems == null && cartItems!.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: Text(
                              "Your Bag is Empty",
                              style: TextStyle(
                                fontFamily: "Gordita",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      if (cartItems != null && cartItems.isNotEmpty)
                        ListView.builder(
                          itemBuilder: (BuildContext context, int i) {
                            final cartItem = cartItems[i];

                            return Carditemscart(cartItem: cartItems[i]);
                          },
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                        ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount: ",
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${totalAmount}\$',
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {},

                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),

                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "Gordita",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),

              appBar: AppBar(
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
