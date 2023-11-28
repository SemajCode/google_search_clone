import 'package:flutter/cupertino.dart';
import 'package:google_search_clone/widget/footer_text.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      children: [
        FooterText(title: 'About'),
        SizedBox(width: 10),
        FooterText(title: 'Advertizing'),
        SizedBox(width: 10),
        FooterText(title: 'Business'),
        SizedBox(width: 10),
        FooterText(title: 'How Search Works'),
        SizedBox(width: 10),
      ],
    );
  }
}
