import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  final String title;
  final String kcal;
  final String time;
  final Image image;
  final bool bookmarked;
  const RecipeCard({super.key, required this.title, required this.kcal, required this.time, required this.image, required this.bookmarked});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(left: 25),
      width: 200,
      child: Column(
        children: [
          ClipRRect(
            // borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Image(
              image: widget.image.image,
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Icon(Icons.fastfood, color: Colors.grey[500],),
                            Text(widget.kcal, style: TextStyle(color: Colors.grey[700]),)
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(Icons.timer, color: Colors.grey[500],),
                            Text(widget.time, style: TextStyle(color: Colors.grey[700]),)
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(widget.bookmarked ? Icons.bookmark : Icons.bookmark_outline, size: 40, color: Color(0xFFEF233C),)
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
