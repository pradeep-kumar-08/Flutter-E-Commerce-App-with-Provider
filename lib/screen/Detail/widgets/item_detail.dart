import 'package:ecomappwithprovider/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ItemDetail extends StatelessWidget {
  final Product product;
  const ItemDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\₹ ${product.price}",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
            ),
            SizedBox(height: 10),
            // for Rating
            Row(
              children: [
                Container(
                  width: 55,
                  height: 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kprimaryColor,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.white),
                          SizedBox(width: 3),
                          Text(
                            product.rate.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  product.review,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(width: 50),
                Text("Seller: ", style: TextStyle(fontSize: 16)),
                Text(
                  product.seller,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
