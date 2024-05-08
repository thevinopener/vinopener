import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/bookmark/bookmark.dart';
import 'package:frontend/services/bookmark_service.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';
import 'package:frontend/widgets/common/atoms/wine_label_widget.dart';

class BookmarkWineItem extends StatefulWidget {
  final Bookmark bookmark;

  const BookmarkWineItem({super.key, required this.bookmark});


  @override
  State<BookmarkWineItem> createState() => _BookmarkWineItemState();
}

class _BookmarkWineItemState extends State<BookmarkWineItem> {
  bool isBookmarked = true;
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Stack(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomCenter, // Ensure label is centered at the bottom of the image
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                      '${widget.bookmark.wine.imageUrl}',
                      width: 100,
                      height: 120,
                    ),
                  ),
                  // Positioned the WineLabel at the bottom center of the image
                  Positioned(
                    bottom: 10,
                    child: WineLabel(type: '${widget.bookmark.wine.type}'),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.bookmark.wine.winery}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: AppFontSizes.mediumSmall,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${widget.bookmark.wine.name}',
                      style: TextStyle(
                        fontSize: AppFontSizes.mediumSmall,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        NationFlag(
                          country: '${widget.bookmark.wine.country}',
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${widget.bookmark.wine.country}',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            child: IconButton(
              icon: Icon(
                isBookmarked ? Icons.star : Icons.star_outline,
                color: AppColors.yellow,
              ),
              onPressed: () {
                setState(() {
                  if (isBookmarked) {
                    BookmarkService.deleteBookmark(widget.bookmark.id);
                  } else {
                    BookmarkService.createBookmark(widget.bookmark.wine.id!);
                  }
                  isBookmarked = !isBookmarked;
                });
              },
              // onPressed: onBookmarkPressed,
            ),
          ),
        ],
      ),
    );
  }
}
