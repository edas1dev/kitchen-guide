import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/recipe_dao.dart';

class BookmarkButton extends StatefulWidget {
  final int recipeId;

  const BookmarkButton({super.key, required this.recipeId});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  double _scale = 1.0;
  late final RecipeDao _recipeDao = RecipeDao();
  late Future<bool> _bookmarkFuture = _recipeDao.isBookmarked(widget.recipeId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _bookmarkFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Icon(Icons.bookmark, size: 40, color: Colors.grey[100],);
        }

        bool isBookmarked = snapshot.requireData;
        return InkWell(
          onTap: _handleBookmarkTap,
          child: AnimatedScale(
            scale: _scale,
            duration: Duration(milliseconds: 100),
            child: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_outline, size: 40, color: Color(0xFFEF233C),),
          ),
        );
      },
    );
  }
  _handleBookmarkTap()  async {
    setState(() => _scale = 0.8);
    await Future.delayed(Duration(milliseconds: 100));
    setState(() => _scale = 1.0);

    setState(() {
      _bookmarkFuture = _recipeDao.toggleBookmark(widget.recipeId);
    });
  }
}
