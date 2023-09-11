import 'package:flutter/material.dart';
import 'package:task_1/widgets/shimmer_loading.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Card(
        surfaceTintColor: Colors.grey.shade300,
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: 242,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
