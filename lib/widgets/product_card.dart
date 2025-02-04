import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // String: title
  final String title;
  // double: price
  final double price;
  // String: image
  final String image;
  // Color: backGroundColor
  final Color backGroundColor;

  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.cyan[100]
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.fromBorderSide(BorderSide(color: Color.fromRGBO(242, 240, 245, 1))),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text: title
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          // spaces
          const SizedBox(
            height: 5,
          ),

          //Text: price
          Text(
            '\$ $price',
            style: Theme.of(context).textTheme.bodySmall,
          ),

          // spaces
          const SizedBox(
            height: 5,
          ),

          // Image.asset: image
          Center(
            child: Image.asset(
              image,
              height: 175,
            ),
          ),
        ],
      ),
    );
  }
}
