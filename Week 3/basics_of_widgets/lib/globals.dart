import 'package:flutter/material.dart';
class Globals {
  static Color topBgColor = const Color(0xFFEEF3FD);
  static List<(Icon, String)> gridItems = const [
    (Icon(Icons.collections_bookmark_rounded), 'Programs'),
    (Icon(Icons.help), 'Get help'),
    (Icon(Icons.menu_book_rounded), 'Learn'),
    (Icon(Icons.align_vertical_top_rounded), 'DD Tracker'),
  ];
  static var sections = {
    "Programs for you": [
      ("LIFESTYLE", "A complete guide for your new born baby", "16 lessons", "assets/images/image1.png"),
      ("WORKING PARENTS", "A complete guide for your new born baby", "16 lessons", "assets/images/image2.png"),
      ("LIFESTYLE", "A complete guide for your new born baby", "16 lessons", "assets/images/image1.png"),
      ("WORKING PARENTS", "A complete guide for your new born baby", "16 lessons", "assets/images/image2.png"),
      ("LIFESTYLE", "A complete guide for your new born baby", "16 lessons", "assets/images/image1.png"),
      ("WORKING PARENTS", "A complete guide for your new born baby", "16 lessons", "assets/images/image2.png"),
    ],
    "Events and experiences": [
      ("BABYCARE", "Understanding of human behaviour", "13 Feb, Sunday", "assets/images/image1.png"),
      ("BABYCARE", "Understanding of human behaviour", "13 Feb, Sunday", "assets/images/image2.png"),
      ("BABYCARE", "Understanding of human behaviour", "13 Feb, Sunday", "assets/images/image1.png"),
      ("BABYCARE", "Understanding of human behaviour", "13 Feb, Sunday", "assets/images/image2.png"),
      ("BABYCARE", "Understanding of human behaviour", "13 Feb, Sunday", "assets/images/image1.png"),
      ("BABYCARE", "Understanding of human behaviour", "13 Feb, Sunday", "assets/images/image2.png"),
      ("BABYCARE", "Understanding of human behaviour", "13 Feb, Sunday", "assets/images/image1.png"),
    ],
    "Lessons for you": [
      ("BABYCARE", "Understanding of human behaviour", "3 min", "assets/images/image1.png"),
      ("BABYCARE", "Understanding of human behaviour", "3 min", "assets/images/image2.png"),
      ("BABYCARE", "Understanding of human behaviour", "3 min", "assets/images/image1.png"),
      ("BABYCARE", "Understanding of human behaviour", "3 min", "assets/images/image2.png"),
      ("BABYCARE", "Understanding of human behaviour", "3 min", "assets/images/image1.png"),
      ("BABYCARE", "Understanding of human behaviour", "3 min", "assets/images/image2.png"),
      ("BABYCARE", "Understanding of human behaviour", "3 min", "assets/images/image1.png"),
    ],
  };
}