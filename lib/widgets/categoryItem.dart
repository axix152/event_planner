import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  CategoryItem({required this.title, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.asset(image),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
            ),
            Text("$price Rs"),
          ],
        ),
      ),
    );
  }
}
