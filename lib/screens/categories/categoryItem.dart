import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  CategoryItem({required this.title, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.left,
              ),
            ),
            Text("$price Rs"),
          ],
        ),
      ),
    );
  }
}
