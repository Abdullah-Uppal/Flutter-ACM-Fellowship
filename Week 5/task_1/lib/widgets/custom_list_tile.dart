import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String category;
  final String title;
  final String subtitle;
  final String image;
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Image.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.35,
            height: 120,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subtitle,
                        style: const TextStyle(height: 1, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
