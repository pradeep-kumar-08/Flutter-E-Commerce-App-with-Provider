import 'package:flutter/material.dart';
import '../../../constants.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,

      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
      ),

      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),

      child: Row(
        children: [
          Icon(Icons.search, size: 30, color: Colors.grey),
          SizedBox(width: 10),
          Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
              ),
            ),
          ),
          //linee
          Container(height: 25, width: 1.5, color: Colors.grey),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.tune, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
