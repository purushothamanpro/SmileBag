import 'package:SmileBag/Mypages/Shop/Products.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'components/categories_horizo_view.dart';

class HomePage extends StatefulWidget {
  // final Function() callParent;
  // HomePage({Key key, @required this.callParent}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // callParent() {
    //   widget.callParent();
    // }

    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 150.0,
            child: Carousel(
              boxFit: BoxFit.cover,
              autoplay: true,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 6.0,
              dotIncreasedColor: Colors.deepOrangeAccent,
              dotBgColor: Colors.transparent,
              dotVerticalPadding: 10.0,
              showIndicator: true,
              indicatorBgPadding: 7.0,
              images: [
                AssetImage('Images/1.jpg'),
                AssetImage('Images/2.jpg'),
                AssetImage('Images/3.jpg'),
              ],
            ),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Shop by Categories",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            child: CategoriesHorizontalView(),
          ),
          new Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Recent Products",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 320.0,
            child: Product(),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0))
        ],
      ),
    );
  }
}
