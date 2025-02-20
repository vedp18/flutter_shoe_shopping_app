import 'package:flutter/material.dart';
import 'package:flutter_shoe_shopping_app/widgets/product_card.dart';
import 'package:flutter_shoe_shopping_app/global_variables.dart';
import 'package:flutter_shoe_shopping_app/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductList> {

  // List<String>: filters
  final List<String> filters = const [
    "All",
    "Addidas",
    "Nike",
    "Bata",
    "Puma "
  ];
  // String: selectedFilter
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {

    // OutlineInputBorder: border
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(120, 120, 120, 1),
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(45)),
    );

    return SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                // Text: Shoes Collection
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Mari\nDukan",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                // TextField: Search Bar
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                      ),
                      border: border,
                      enabledBorder: border,
                    ),
                    textAlignVertical: TextAlignVertical(y: -0.3),
                  ),
                ),
              ],
            ),

            // ListView: Filters ["ALl", "Addidas", "Nike", "Bata"]
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromRGBO(243, 245, 247, 1),
                        side: const BorderSide(
                            color: Color.fromRGBO(242, 240, 245, 1)),
                        label: Text(filter),
                        labelStyle: TextStyle(
                          fontSize: 16,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 7,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // ListView: [ProductCard]
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return ProductDetailsPage(product: product);
                        }),
                      );
                    },
                    child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                        backGroundColor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(243, 245, 247, 1)),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}