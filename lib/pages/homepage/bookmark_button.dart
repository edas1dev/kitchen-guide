import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/db_helper.dart';
import 'package:kitchen_guide/db/recipe_dao.dart';

class BookmarkButton extends StatefulWidget {
  final int recipeId;

  const BookmarkButton({super.key, required this.recipeId});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  double _scale = 1.0;
  late bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecipeDao().isBookmarked(widget.recipeId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[10],
              shape: BoxShape.circle,
            ),
          );
        }
        isBookmarked = snapshot.requireData;
        return InkWell(
          onTapDown: (_) => setState(() => _scale = 2.0),
          onTapUp: (_) => setState(() => _scale = 1.0),
          onTapCancel: () => setState(() => _scale = 1.0),
          child: AnimatedScale(
            scale: _scale,
            duration: Duration(milliseconds: 100),
            child: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_outline, size: 40, color: Color(0xFFEF233C),),
          ),
          onTap: () async {
            isBookmarked = await RecipeDao().toggleBookmark(widget.recipeId);
          },
        );
      },
    );
  }
}
