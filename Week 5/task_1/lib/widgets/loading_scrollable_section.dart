import 'package:flutter/material.dart';
import 'package:task_1/widgets/cards/loading_card.dart';

class LoadingScrollableSection extends StatefulWidget {
  const LoadingScrollableSection({super.key});

  @override
  State<LoadingScrollableSection> createState() =>
      _LoadingScrollableSectionState();
}

class _LoadingScrollableSectionState extends State<LoadingScrollableSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  width: 200,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade300,
                  )),
              Row(
                children: [
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                  Icon(
                    Icons.arrow_right_alt_rounded,
                    color: Colors.grey.shade500,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 280,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const LoadingCard();
            },
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
