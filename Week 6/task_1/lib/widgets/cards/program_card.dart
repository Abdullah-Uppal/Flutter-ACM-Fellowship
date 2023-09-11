import 'package:flutter/material.dart';
import 'package:task_1/widgets/cards/custom_card.dart';
import 'package:task_1/models/program.dart';

class ProgramCard extends StatelessWidget {
  final Program program;
  const ProgramCard({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return CustomCard(item: (
      program.category ?? "Uncategorized",
      program.name ?? "No name",
      "${program.lesson} lessons",
      program.image,
    ));
  }
}
