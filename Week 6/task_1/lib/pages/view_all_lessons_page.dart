import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/app_state.dart';
import 'package:task_1/globals.dart';
import 'package:task_1/widgets/custom_list_tile.dart';

class ViewAllLessonsPage extends StatelessWidget {
  const ViewAllLessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lessons"),
          backgroundColor: Globals.topBgColor,
          surfaceTintColor: Globals.topBgColor,
        ),
        body: Consumer<AppState>(builder: (context, state, _) {
          return FutureBuilder(
              future: state.lessons,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var lessons = snapshot.data!;
                  return ListView.separated(
                    padding: const EdgeInsets.all(10),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      return CustomListTile(
                        category: lessons[index].category ?? "Uncategorized",
                        title: lessons[index].name ?? "No name",
                        subtitle: "${lessons[index].duration ?? 0} min",
                        image: lessons[index].image,
                      );
                    },
                    itemCount: lessons.length,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              });
        }));
  }
}
