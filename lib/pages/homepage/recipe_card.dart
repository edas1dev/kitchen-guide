import 'package:flutter/material.dart';
import 'package:kitchen_guide/domain/recipe.dart';
import 'package:kitchen_guide/pages/homepage/bookmark_button.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

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
      margin: EdgeInsets.only(right: 25),
      width: 200,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Image.asset(
              widget.recipe.image,
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
                Text(widget.recipe.title, style: TextStyle(fontWeight: FontWeight.bold),),
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
                            Text(widget.recipe.kcal, style: TextStyle(color: Colors.grey[700]),)
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(Icons.timer, color: Colors.grey[500],),
                            Text(widget.recipe.time, style: TextStyle(color: Colors.grey[700]),)
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    BookmarkButton(
                      recipe_id: widget.recipe.id,
                      is_bookmarked:  widget.recipe.bookmarked
                    )
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
