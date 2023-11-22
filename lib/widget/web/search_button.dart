import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';

class SearchButton extends StatelessWidget {
  final String title;
  const SearchButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 18,
      ),
      color: searchColor,
      elevation: 0,
      child: Text(title),
    );
  }
}
