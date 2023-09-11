import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/widgets/cards/lesson_card.dart';
import 'package:task_1/models/program.dart';
import 'cards/program_card.dart';
import '../models/lesson.dart';

class ScrollableSection extends StatefulWidget {
  final String title;
  final List<Object> items;
  final VoidCallback onSeeAllPressed;
  final Widget? action;
  const ScrollableSection({
    super.key,
    required this.title,
    required this.onSeeAllPressed,
    required this.items,
    this.action,
  });

  @override
  State<ScrollableSection> createState() => _ScrollableSectionState();
}

class _ScrollableSectionState extends State<ScrollableSection> {
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
              Text(
                widget.title,
                style: GoogleFonts.ptSerif(fontSize: 20),
              ),
              GestureDetector(
                onTap: widget.onSeeAllPressed,
                child: Row(
                  children: [
                    Text(
                      "View all",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                    Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.grey.shade500,
                      size: 20,
                    ),
                  ],
                ),
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
              var item = widget.items[index];
              switch (item.runtimeType) {
                case Program:
                  return ProgramCard(program: item as Program);
                case Lesson:
                  return LessonCard(lesson: item as Lesson);
              }
              return null;
            },
            itemCount: widget.items.length,
          ),
        ),
      ],
    );
  }
}
