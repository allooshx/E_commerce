import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/database_controller.dart';
import '../widgets/Product.dart';
import '../widgets/list_items.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  static String Gordita = "Gordita";

  Widget _buildHeaderOfList(
    BuildContext context,
    String title,
    VoidCallback? onTap,
    String description,
    String? Gordita,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: Gordita,
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: Gordita,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                      fontFamily: Gordita,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: size.height * 0.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  child: Text(
                    "Street clothes",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: Gordita,
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _buildHeaderOfList(
                  context,
                  "Sale",
                  () {},
                  "Super summer sale",
                  Gordita,
                ),
              ],
            ),

            SizedBox(
              height: 300,
              child: StreamBuilder<List<Product>>(
                stream: database.saleProductsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final products = snapshot.data;
                    if (products == null || products.isEmpty) {
                      return Center(child: Text("No Data Available!"));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListItemsHome(product: products[index]),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Column(
              children: [
                _buildHeaderOfList(
                  context,
                  "New",
                  () {},
                  "You’ve never seen it before!",
                  Gordita,
                ),
              ],
            ),

            SizedBox(
              height: 300,
              child: StreamBuilder<List<Product>>(
                stream: database.newProductsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final products = snapshot.data;
                    if (products == null || products.isEmpty) {
                      return Center(child: Text("No Data Available!"));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListItemsHome(product: products[index]),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
