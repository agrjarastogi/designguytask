import 'package:ecommerce/constants/colorModel.dart';
import 'package:ecommerce/view/page_layouts/home_screen.dart';
import 'package:ecommerce/view/page_layouts/orders_page.dart';
import 'package:ecommerce/view/page_layouts/wishlist_page.dart';
import 'package:ecommerce/view/page_layouts/cart.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  int index = 3;

  late TabController tabController;
  List<Widget> pages = [HomeScreen(),WishList(), Orders(), Cart()];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this,initialIndex: 0,animationDuration: const Duration(milliseconds: 80));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: pages,
        index: index,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (val){
          setState(() {
            index = val;
          });
        },
        unselectedIconTheme: const IconThemeData(
          color: Colors.white
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            activeIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.home, color: colorSchemeLight.primary,),
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
            activeIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.favorite, color: colorSchemeLight.primary,),
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Orders',
            activeIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.person, color: colorSchemeLight.primary,),
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            activeIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.shopping_cart, color: colorSchemeLight.primary,),
              ),
            )
          ),
        ],
      )
    );
  }
}
