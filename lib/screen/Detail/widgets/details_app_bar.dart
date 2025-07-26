import 'package:ecomappwithprovider/constants.dart';
import 'package:ecomappwithprovider/models/product_model.dart';
import 'package:ecomappwithprovider/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

class DetailsAppBar extends StatelessWidget {
  final Product product;
  const DetailsAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 30,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.share_outlined),
          ),
          SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {
              provider.toggleFavorite(product);
            },
            iconSize: 30,
            icon: Icon(
              provider.isExist(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
