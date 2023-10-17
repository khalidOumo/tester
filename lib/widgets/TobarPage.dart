import 'package:flutter/material.dart';
import 'package:my_project/Screens/FavoriteScreen.dart';
import 'package:my_project/Screens/HomeScreen.dart';
import 'package:my_project/Screens/PersonneScreen.dart';
import 'package:my_project/Screens/ScanPage.dart';
import 'package:my_project/Screens/ShoppingScreen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:my_project/constant.dart';
import 'package:page_transition/page_transition.dart';

class TobarPage extends StatefulWidget {
  const TobarPage({super.key});

  @override
  State<TobarPage> createState() => _TobarPageState();
}

class _TobarPageState extends State<TobarPage> {

  int bottomNavIndex = 0;

  //List of the pages
  List<Widget> pages = const [
    HomeScreen(),
    favoratScreen(),
    ShoppingScreen(),
    PersonneScreen(),
  ];

  //List of the pages Icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  //List of the pages name
  List<String> nameList = [
    "Home",
    "Favorite",
    "Cart",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index:bottomNavIndex,
          children: pages,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Constants.primaryColor,
          onPressed: (){
            Navigator.push(context, PageTransition(child:const ScanPage(),type:PageTransitionType.bottomToTop));
          },
          child: const Image(image: NetworkImage("assets/code-scan-two.png"),height: 30.0,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          gapLocation: GapLocation.center,
          activeIndex: bottomNavIndex,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index){
            setState(() {
              bottomNavIndex = index;
            });
          },
        ),
    );
  }
}