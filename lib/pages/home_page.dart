import 'package:flutter/material.dart';
import 'package:flutter_shoe_shopping_app/pages/cart_list_page.dart';
import 'package:flutter_shoe_shopping_app/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // int: currentPage
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // int: currentPage

    // List<Widget>: pages or screens
    List<Widget> pages = const [ProductList(), CartListPage()];

    return Scaffold(

      // body: main screen or page from pages[product_list, cart_list]
      body: IndexedStack(     // using IndexedStak for remembring state of product list or position before transition to cart_list
        index: currentPage,
        children: pages,
      ),

      //bottomNavigationBar: navigation bar [ home, cart]
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 27,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          // BottomeNavigationBarItem: Home
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '',
          ),
          // BottomNavigationBarItem: Cart
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: '')
        ],
      ),
    );
  }
}
