import 'package:ecommerce/controller/database_controller.dart';
import 'package:ecommerce/view/widgets/checkout/delivery_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/DeliveryMethod.dart';
import '../../widgets/checkout/payment_component.dart';
import '../../widgets/checkout/shipping_address.dart';
import 'PaymentMethodScreen.dart';

class Checkoutscreen extends StatefulWidget {
  const Checkoutscreen({super.key});

  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
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
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shipping address",
                style: TextStyle(
                  fontFamily: "Gordita",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              ShippingAddress(),
              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(
                      fontFamily: "Gordita",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
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
              PaymentComponent(),
              SizedBox(height: 32),

              Text(
                "Delivery Method",
                style: TextStyle(
                  fontFamily: "Gordita",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),

              StreamBuilder<List<DeliveryMethod>>(
                stream: database.deliveryMethodsStream(),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.connectionState == ConnectionState.active) {
                    final deliveryMethods = asyncSnapshot.data;
                    if(deliveryMethods==null||deliveryMethods.isEmpty){
                      return Center(
                        child: Text("No Delivery Methods "),
                      );
                    }

                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount:deliveryMethods.length ,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_,i){
                          final deliveryMethod = deliveryMethods[i];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DeliveryComponent(deliveryMethod: deliveryMethod),
                          );
                        },

                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator.adaptive());
                },
              ),
              SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order:",
                    style: TextStyle(
                      fontFamily: "Gordita",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "122\$",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Gordita",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery:",
                    style: TextStyle(
                      fontFamily: "Gordita",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "5\$",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Gordita",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Summary:",
                    style: TextStyle(
                      fontFamily: "Gordita",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "127\$",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Gordita",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide.none,
                  ),
                  backgroundColor: Colors.redAccent,
                  minimumSize: Size(double.infinity, 55),
                  elevation: 1,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  "SUBMIT ORDER",
                  style: TextStyle(
                    fontFamily: "Gordita",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
