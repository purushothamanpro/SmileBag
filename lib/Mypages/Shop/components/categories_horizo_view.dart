import 'package:flutter/material.dart';

class CategoriesHorizontalView extends StatelessWidget {
  const CategoriesHorizontalView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            imageLocation: 'Images/brinjal.png',
            imageCaption: "Brinjal",
          ),
          Category(
            imageLocation: 'Images/onion.png',
            imageCaption: "Oninon",
          ),
          Category(
            imageLocation: 'Images/potato.png',
            imageCaption: "Potato",
          ),
          Category(
            imageLocation: 'Images/shampoo.png',
            imageCaption: "Shanpo",
          ),
          Category(
            imageLocation: 'Images/veg4.png',
            imageCaption: "Brinjal",
          ),
          Category(
            imageLocation: 'Images/veg5.png',
            imageCaption: "Brinjal",
          ),
          Category(
            imageLocation: 'Images/brinjal.png',
            imageCaption: "Brinjal",
          ),
          Category(
            imageLocation: 'Images/brinjal.png',
            imageCaption: "Brinjal",
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageLocation, this.imageCaption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 100.0,
              height: 60.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imageCaption,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
