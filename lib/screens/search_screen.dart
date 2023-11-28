import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';
import 'package:google_search_clone/widget/search_footer.dart';
import 'package:google_search_clone/widget/search_header.dart';
import 'package:google_search_clone/widget/search_taps.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // web header
            const SearchHeader(),
            // taps for news images
            const Padding(
              padding: EdgeInsets.only(left: 150.0),
              child: SearchTaps(),
            ),
            const Divider(
              height: 0,
              thickness: 0.3,
            ),
            // search result component

            // pagination buttons
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '« Previous ',
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Next »',
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            const SearchFooter(),
          ],
        ),
      ),
    );
  }
}
