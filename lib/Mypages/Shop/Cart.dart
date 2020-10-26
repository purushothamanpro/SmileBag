import 'package:SmileBag/Mypages/Shop/components/CartProducts.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            height: 300.0,
            child: CartProducts(),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Total"),
                    subtitle: Text("Rs.300"),
                  ),
                ),
                Expanded(
                    child: MaterialButton(
                  onPressed: () {},
                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  child: Text("Check Out"),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
