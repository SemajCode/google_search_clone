import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';
import 'package:google_search_clone/services/api_service.dart';
import 'package:google_search_clone/widget/search_footer.dart';
import 'package:google_search_clone/widget/search_header.dart';
import 'package:google_search_clone/widget/search_result_component.dart';
import 'package:google_search_clone/widget/search_taps.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.searchQuery,
    required this.start,
  });

  final String searchQuery;
  final String start;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // web header
            const SearchHeader(),
            // taps for news images
            Padding(
              padding: EdgeInsets.only(left: size.width <= 768 ? 10.0 : 150.0),
              child: const SearchTaps(),
            ),
            const Divider(
              height: 0,
              thickness: 0.3,
            ),
            // search result component

            FutureBuilder(
              future:
                  ApiService().fetchData(queryTerm: searchQuery, start: start),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: size.width <= 768 ? 10.0 : 150,
                          top: 12,
                        ),
                        child: Text(
                          'About ${snapshot.data?['searchInformation']['formattedTotalResults']} result (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xff70757a),
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: snapshot.data?['items'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: size.width <= 768 ? 10.0 : 150,
                              top: 10,
                            ),
                            child: SearchResultComponent(
                              text: snapshot.data?['items'][index]['title'],
                              linkToGo: snapshot.data?['items'][index]['link'],
                              desc: snapshot.data?['items'][index]['snippet'],
                              link: snapshot.data?['items'][index]
                                  ['formattedUrl'],
                            ),
                          );
                        },
                      ),
                      // pagination buttons
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (start != '0') {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                        searchQuery: searchQuery,
                                        start:
                                            (int.parse(start) - 10).toString(),
                                      ),
                                    ),
                                  );
                                }
                              },
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
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen(
                                      searchQuery: searchQuery,
                                      start: (int.parse(start) + 10).toString(),
                                    ),
                                  ),
                                );
                              },
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
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
