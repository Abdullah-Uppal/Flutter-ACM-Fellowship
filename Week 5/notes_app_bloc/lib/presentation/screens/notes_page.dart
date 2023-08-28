import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app_bloc/data/models/note.dart';
import 'package:notes_app_bloc/logic/login_cubit/login_cubit.dart';
import 'package:notes_app_bloc/logic/notes_cubit/notes_cubit.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      AppBar(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          backgroundImage: NetworkImage(
                            (state as LoginSuccessful)
                                    .credential
                                    .user!
                                    .photoURL ??
                                "",
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(
                              "morning, ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .fontSize),
                            ),
                            Text(
                              state.credential.user!.displayName!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .fontSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            body: BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                if (state is NotesLoaded) {
                  print("BUILDING list");
                  return customListView(state.notes, context);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xfffe6902),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () {
                context.push("/add");
              },
              child: const Icon(Icons.add),
            )),
      ),
    );
  }

  Widget customListView(List<Note> notes, BuildContext context) {
    notes.sort((a, b) => -b.createdAt.compareTo(a.createdAt));
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "your",
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .fontSize,
                          fontWeight: FontWeight.w500,
                          height: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        " notes",
                        style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .fontSize,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "/${notes.length}",
                  style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.displayLarge!.fontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.5),
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 50.0),
          sliver: SliverList.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notes[index].title),
                    Text(
                      notes[index].description,
                      maxLines: 2,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: notes.length,
          ),
        ),
      ],
    );
  }
}
