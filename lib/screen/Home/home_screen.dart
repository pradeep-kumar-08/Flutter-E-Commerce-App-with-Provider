import 'package:ecomappwithprovider/constants.dart';
import 'package:ecomappwithprovider/models/category.dart';
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
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion,
    ];

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
              SizedBox(
                height: 130,
                child: ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color:
                              selectedindex == index
                                  ? Colors.blue[200]
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(categories[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            Center(
                              child: Text(
                                categories[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 10),
                ),
              ),
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

                itemCount: selectedCategories[selectedindex].length,
                itemBuilder: (context, index) {
                  return ProductCart(
                    product: selectedCategories[selectedindex][index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
