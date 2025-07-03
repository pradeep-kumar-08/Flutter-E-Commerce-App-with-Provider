import 'package:ecomappwithprovider/constants.dart';
import 'package:ecomappwithprovider/screen/Home/Widget/Home_app_bar.dart';
import 'package:ecomappwithprovider/screen/Home/Widget/image_slider.dart';
import 'package:ecomappwithprovider/screen/Home/Widget/product_cart.dart';
import 'package:ecomappwithprovider/screen/Home/Widget/search_bar.dart';
import 'package:ecomappwithprovider/screen/Home/Widget/category.dart';
import 'package:ecomappwithprovider/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currerntSlider = 0;
  @override
  Widget build(BuildContext context) {
    // return Center(child: Container(child: Text("Home Screen")));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35),
              // to custom AppBar
              coustomAppBar(),
              SizedBox(height: 20),
              // for search bar
              MySearchBar(),
              SizedBox(height: 20),

              // super sale discound iamge
              ImageSlider(
                currentSlide: currerntSlider,
                onChange: (value) {
                  setState(() {
                    currerntSlider = value;
                  });
                },
              ),
              SizedBox(height: 20),
              // for category selction
              Categories(),
              // =============================Spacial Fot you =====See All====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spacial For You",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  // SizedBox(width: 10),
                ],
              ),
              // For shopping item=======================================
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.88,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCart(product: products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
