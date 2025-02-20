import 'package:flutter/material.dart';
import 'package:flutter_shoe_shopping_app/Providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  // Map<String, Object>: product
  final Map<String, Object> product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // int: size
  int selectedSize = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   size = product['']
  // }

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'size': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Product Added to Cart Succesfully!!",
        ),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Select a Size!!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Title: Details
        title: Center(
          child: const Text(
            "Details",
          ),
        ),
      ),

      // Body: Column
      body: Column(
        children: [
          // Text: title
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          // Spacer
          const Spacer(),
          // Image.asset: product['image']
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          // Spacer
          const Spacer(),

          // Container: reamining details
          Container(
            padding: const EdgeInsets.only(top: 36, left: 7, right: 7),
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 192, 255, 229),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                // Text: product['price']
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                // spaces
                const SizedBox(
                  height: 12,
                ),

                //ListView.builder: product['sizes']
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            label: SizedBox(
                              width: 15,
                              child: Center(
                                heightFactor: 1,
                                child: Text(
                                  size.toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //spaces
                const SizedBox(
                  height: 12,
                ),

                // ElevatedButton: Add to Cart
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
