import 'package:SmileBag/Mypages/Shop/Cart.dart';
import 'package:SmileBag/Mypages/Shop/Categories.dart';
import 'package:SmileBag/Mypages/Shop/HomePage.dart';
import 'package:SmileBag/Mypages/Shop/Offers.dart';
import 'package:SmileBag/Mypages/Shop/Orders.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SmileBag/Mypages/Login/AuthPage.dart';

class ShopHomePage extends StatefulWidget {
  @override
  ShopHomePageState createState() => ShopHomePageState();
}

class ShopHomePageState extends State<ShopHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff6CBE45),
    ));
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color(0xff6CBE45),
        title: Center(
          child: Row(
            children: [
              Text(
                "Smile",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
              Text(
                "Bag",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        actions: [
          new Stack(
            children: <Widget>[
              new IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                  }),
              counter != 0
                  ? new Positioned(
                      right: 11,
                      top: 11,
                      child: new Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : new Container()
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Center(
              child: UserAccountsDrawerHeader(
                accountName: Text("User"),
                accountEmail: Text("user@user.com"),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: Color(0xff6CBE45)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Shop"),
                leading: Icon(
                  Icons.store,
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("House Rental"),
                  leading: Icon(
                    Icons.home,
                    color: Colors.green,
                  )),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Advertisements"),
                  leading: Icon(
                    Icons.add_business,
                    color: Colors.green,
                  )),
            ),
            Divider(),
            InkWell(
              onTap: () {
                AuthPage().signOut();
              },
              child: ListTile(
                  title: Text("Logout"),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.deepOrangeAccent,
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.list_outlined, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.local_offer, size: 30, color: Colors.white),
          Stack(
            children: [
              Icon(Icons.shopping_cart_outlined, size: 30, color: Colors.white),
              Positioned(
                right: 1,
                top: 1,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )
        ],
        color: Color(0xff6CBE45),
        // color: Colors.lime,
        buttonBackgroundColor: Color(0xff6CBE45),
        backgroundColor: Colors.white,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
          print(index);
        },
      ),
      body: SafeArea(
          child: Stack(
        children: [
          // Align(
          //   alignment: Alignment(-1, -0.9),
          //   child: GestureDetector(
          //     onTap: () {
          //       _scaffoldKey.currentState.openDrawer();
          //     },
          //     child: ClipPath(
          //       clipper: CustomMenuClipper(),
          //       child: Container(
          //         width: 30,
          //         height: 90,
          //         color: Color(0xff6CBE45),
          //         alignment: Alignment.centerLeft,
          //         child: Icon(
          //           Icons.menu,
          //           color: Colors.yellow,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          Container(
              child: (_page == 0)
                  ? HomePage()
                  : (_page == 1)
                      ? Categories()
                      : (_page == 2)
                          ? Orders()
                          : (_page == 3)
                              ? Offers()
                              : Cart())
        ],
      )),
    );
  }
}

// class CustomMenuClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Paint paint = Paint();
//     paint.color = Colors.white;

//     final width = size.width;
//     final height = size.height;

//     Path path = Path();
//     path.moveTo(0, 0);
//     path.quadraticBezierTo(0, 8, 10, 16);
//     path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
//     path.quadraticBezierTo(width - 1, height / 2 + 20, 10, height - 16);
//     path.quadraticBezierTo(0, height - 8, 0, height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }
