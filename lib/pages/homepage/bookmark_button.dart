import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/db_helper.dart';
import 'package:kitchen_guide/db/recipe_dao.dart';

class BookmarkButton extends StatefulWidget {
  bool is_bookmarked;
  final int recipe_id;
  double _scale = 1.0;

  BookmarkButton({super.key, required this.recipe_id, required this.is_bookmarked});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) => setState(() => widget._scale = 0.8),
      onTapUp: (_) => setState(() => widget._scale = 1.0),
      onTapCancel: () => setState(() => widget._scale = 1.0),
      child: AnimatedScale(
        scale: widget._scale,
        duration: Duration(milliseconds: 100),
        child: Icon(widget.is_bookmarked ? Icons.bookmark : Icons.bookmark_outline, size: 40, color: Color(0xFFEF233C),),
      ),
      onTap: () async {
        await RecipeDao().setRecipeBookmarkedState(widget.recipe_id, widget.is_bookmarked);
        setState(() {
          widget.is_bookmarked = !widget.is_bookmarked;
        });
      },
    );
  }
}
