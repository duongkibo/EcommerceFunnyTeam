import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:welcome_demo/screens/login/login_screen.dart';
import 'package:welcome_demo/screens/signup/components/sign_up_form.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Home createState() => _Home();
}


class _Home extends State<Home> {
  int currentIndex =0;
  final List<Widget> _children = [
    LoginScreen(),
    SignUpForm(),
    SignUpForm(),
    LoginScreen(),
    LoginScreen(),

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: BubbleBottomBar(
          hasNotch: false,
          opacity: .1,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),

          ), //border radius doesn't work when the notch is enabled.
          elevation: 16,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home_outlined,
                  color: Colors.red,
                ),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
                title: Text("Shop")),
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.red,
                ),
                title: Text("Bag")),
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.favorite_border_sharp,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.favorite_border_sharp,
                  color: Colors.red,
                ),
                title: Text("Favorite")),
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.perm_identity_sharp,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.perm_identity_sharp,
                  color: Colors.red,
                ),
                title: Text("Favorite"))
          ],
        ),
      ),
    );
  }
}