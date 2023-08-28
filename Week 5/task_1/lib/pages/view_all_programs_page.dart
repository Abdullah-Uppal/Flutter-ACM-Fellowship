import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/app_state.dart';
import 'package:task_1/globals.dart';
import 'package:task_1/widgets/custom_list_tile.dart';

class ViewAllProgramsPage extends StatelessWidget {
  const ViewAllProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Programs"),
          backgroundColor: Globals.topBgColor,
          surfaceTintColor: Globals.topBgColor,
        ),
        body: Consumer<AppState>(builder: (context, state, _) {
          return FutureBuilder(
              future: state.programs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var programs = snapshot.data!;
                  return ListView.separated(
                    padding: const EdgeInsets.all(10),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      return CustomListTile(
                        category: programs[index].category ?? "Uncategorized",
                        title: programs[index].name ?? "No name",
                        subtitle: "${programs[index].lesson} lessons",
                        image: programs[index].image,
                      );
                    },
                    itemCount: programs.length,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              });
        }));
  }
}
