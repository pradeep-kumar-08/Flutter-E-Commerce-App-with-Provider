import 'package:ecomappwithprovider/models/product_model.dart';
import 'package:ecomappwithprovider/screen/Detail/widgets/addTocart.dart';
import 'package:ecomappwithprovider/screen/Detail/widgets/description.dart';
import 'package:ecomappwithprovider/screen/Detail/widgets/detail_image.dart';
import 'package:ecomappwithprovider/screen/Detail/widgets/details_app_bar.dart';
import 'package:ecomappwithprovider/screen/Detail/widgets/item_detail.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int currentImage = 0;
  int currentSlide = 0;
  int currentColor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // For Add To Dart Item
      floatingActionButton: Addtocart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // For back button & share & favorait
              DetailsAppBar(product: widget.product,),
              // fot datail image
              DetailImage(
                image: widget.product.image,
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: Duration(microseconds: 300),
                    width: currentImage == index ? 15 : 8,
                    height: 8,

                    margin: EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          currentImage == index
                              ? Colors.black
                              : Colors.transparent,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemDetail(product: widget.product),
                    SizedBox(height: 20),
                    Text(
                      "Color",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: List.generate(
                        widget.product.colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(microseconds: 300),
                            width: 40,
                            height: 40,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color:
                                  currentColor == index
                                      ? Colors.white
                                      : widget.product.colors[index],

                              border:
                                  currentColor == index
                                      ? Border.all(
                                        color: widget.product.colors[index],
                                      )
                                      : null,
                            ),
                            padding:
                                currentColor == index
                                    ? EdgeInsets.all(2)
                                    : null,
                            margin: EdgeInsets.only(right: 10),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: widget.product.colors[index],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // For Description
                    Description(discription: widget.product.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
