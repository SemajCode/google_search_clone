import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';

class SearchFooter extends StatelessWidget {
  const SearchFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: footerColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width <= 768 ? 10.0 : 150,
              vertical: 15,
            ),
            child: Row(
              children: [
                Text(
                  'Nigeria',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 10),
                Container(height: 20, width: 0.5, color: Colors.grey),
                const SizedBox(width: 10),
                const Icon(
                  Icons.circle,
                  color: Color(0xff70757a),
                  size: 12,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Uyo, Akwa Ibom',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0,
          height: 9,
          color: Colors.black26,
        ),
        Container(
          color: footerColor,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: const Row(
            children: [
              Text(
                'Help',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(width: 20),
              Text(
                'Send feedback',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(width: 20),
              Text(
                'Privacy',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(width: 20),
              Text(
                'Terms and condtions',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
