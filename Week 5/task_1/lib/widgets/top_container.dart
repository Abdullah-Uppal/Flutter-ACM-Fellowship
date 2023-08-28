import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopContainer extends StatelessWidget {
  final List<(Icon, String)> gridItems;
  final Color bgColor;
  final String heading;
  final String subheading;
  const TopContainer({
    super.key,
    required this.gridItems,
    required this.bgColor,
    required this.heading,
    required this.subheading,
  });

  @override
  Widget build(BuildContext context) {
    assert(gridItems.length >= 2 && gridItems.length <= 4);
    return Container(
      color: bgColor,
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: GoogleFonts.ptSerif(fontSize: 25),
          ),
          Text(
            subheading,
            style: GoogleFonts.openSans(),
          ),
          const SizedBox(height: 30),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 50),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: gridItems.map((item) {
              return OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.centerLeft,
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {},
                icon: item.$1,
                label: Text(
                  item.$2,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
