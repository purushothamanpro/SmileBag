import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "1.Beverages, சூடான / குளிர் பானங்கள் \n2.Bread/Bakery ரொட்டி / பேக்கரி  \n 3.Canned/Jarred Goods கேன் / ஜார் பொருட்கள்\n 4.Dairy பால் \n 5.Dry/Baking Goods உலர் / பேக்கிங் பொருட்கள் \n 6. Frozen Foods உறைந்த உணவுகள் \n 7. Meat இறைச்சி",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
