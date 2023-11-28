import 'package:flutter/material.dart';
import 'package:google_search_clone/widget/search_tap.dart';

class SearchTaps extends StatelessWidget {
  const SearchTaps({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SearchTap(
            isActive: true,
            text: 'All',
            icon: Icons.search,
          ),
          SizedBox(width: 20),
          SearchTap(
            text: 'Images',
            icon: Icons.image,
          ),
          SizedBox(width: 20),
          SearchTap(
            text: 'Maps',
            icon: Icons.map,
          ),
          SizedBox(width: 20),
          SearchTap(
            text: 'News',
            icon: Icons.article,
          ),
          SizedBox(width: 20),
          SearchTap(
            text: 'Shopping',
            icon: Icons.shop,
          ),
          SizedBox(width: 20),
          SearchTap(
            text: 'More',
            icon: Icons.more_vert,
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
