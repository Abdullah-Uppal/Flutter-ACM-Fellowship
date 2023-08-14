import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final (String, String, String, String) item;
  final Widget? action;
  const CustomCard({
    super.key,
    required this.item,
    this.action,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 242,
        child: Column(
          children: [
            Image.asset(
              widget.item.$4,
              height: 141,
              width: 280,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.item.$1,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        height: 1,
                      ),
                    ),
                    Text(
                      widget.item.$2,
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
                          widget.item.$3,
                          style: const TextStyle(height: 1, fontSize: 12),
                        ),
                        widget.action ?? Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
